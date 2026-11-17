; config.g - RailCore Mini kit
; Duet 3 Mini 5+ WiFi + Duet 3 Expansion Mini 2+, RepRapFirmware 3.6.x / 3.7.x (standalone, no SBC)
;
; Based on the kit config in railcore/railcore-mini (config/Duet3 Mini 5+), updated
; for RRF 3.6/3.7. Lines marked "CHECK:" must be verified on YOUR machine before
; printing. Read the README in this folder first.

; ---------------------------------------------------------------------------
; General
; ---------------------------------------------------------------------------
M111 S0                                  ; debug off
M550 P"RailCoreMini"                     ; machine name
G21                                      ; work in millimetres
G90                                      ; absolute coordinates...
M83                                      ; ...but relative extruder moves

; ---------------------------------------------------------------------------
; Network
; ---------------------------------------------------------------------------
M552 S1                                  ; enable WiFi (joins the network saved with M587)
M586 P0 S1                               ; enable HTTP - required from RRF 3.7, harmless before
M586 P1 S0                               ; FTP off
M586 P2 S0                               ; Telnet off

; PanelDue on the PanelDue/io0 port. RRF 3.7 renumbered the serial channels
; (P1 is now a second USB channel), so pick the right one for the running firmware.
if take(boards[0].firmwareVersion,3) = "3.6"
  M575 P1 S1 B57600                      ; RRF 3.6: first aux port = P1
else
  M575 P2 S1 B57600                      ; RRF 3.7+: first aux port = P2

; ---------------------------------------------------------------------------
; Kinematics and drives
; ---------------------------------------------------------------------------
M669 K1                                  ; CoreXY. The kit config used M667 S1, which RRF 3.5+ rejects

; Drive map (kit config.g and guide S "First Moves"):
;   0 = extruder                        2 = Z front right
;   3 = Z rear right                    4 = Z left
;   5 = Y / front stepper (Expansion Mini 2+)
;   6 = X / rear stepper  (Expansion Mini 2+)
; CHECK: guide Q step 11 labels drive 5 "X (front)" and drive 6 "Y (rear)", but the
; kit config and guide S use X = drive 6 (rear), Y = drive 5 (front). Wire to the
; config, then confirm with the guide S step 2-3 move tests.
M569 P0 S0 D3                            ; CHECK: extruder direction (guide T step 6; on the Mini this is P0, not P3)
M569 P2 S0 D3                            ; CHECK: Z front right direction (guide S step 4)
M569 P3 S0 D3                            ; CHECK: Z rear right direction
M569 P4 S0 D3                            ; CHECK: Z left direction
M569 P5 S1 D3                            ; CHECK: Y / front direction (guide S step 3)
M569 P6 S0 D3                            ; CHECK: X / rear direction (guide S step 2)
; D3 = stealthChop (kit choice, quiet). If X/Y lose steps at high speed or
; acceleration, change X/Y/E to D2 (spreadCycle).
M584 X6 Y5 Z4:3:2 E0                     ; map axes to drives (Z order matches M671 below)

; Leadscrew positions for G32: left, rear right, front right
M671 X-5:165:165 Y90:155:22.5 S7.5       ; CHECK: leadscrew X/Y positions; S7.5 = max correction (mm)

M350 X16 Y16 Z16 E16 I1                  ; 16x microstepping with interpolation
M92 X200 Y200 Z1600 E562                 ; steps/mm. E562 = Bondtech LGX Lite; calibrate your extruder
M906 X1400 Y1400 Z1200 E800 I80          ; motor currents (mA), 80% idle. CHECK: against your motors' rated current (LGX Lite motor especially)
M84 S30                                  ; idle timeout (s)

; Speeds, accelerations, jerk (kit values)
M203 X12000 Y12000 Z900 E3600            ; max speeds (mm/min)
M201 X2000 Y2000 Z150 E1500              ; max accelerations (mm/s^2)
M204 P1400 T4000                         ; print / travel acceleration
M566 X1000 Y1000 Z150 E1800              ; max jerk (mm/min). RRF 3.6: M205 can no longer exceed these

; ---------------------------------------------------------------------------
; Axis limits
; ---------------------------------------------------------------------------
M208 X0 Y0 Z0 S1                         ; axis minima
M208 X150 Y150 Z150 S0                   ; CHECK: axis maxima - measure yours (guide T step 3)

; ---------------------------------------------------------------------------
; Endstops (guide Q step 5)
; ---------------------------------------------------------------------------
M574 X2 S1 P"io2.in"                     ; X endstop at the rear right = X maximum. CHECK: M119 shows "at max stop"
M574 Y1 S1 P"io4.in"                     ; Y endstop = Y minimum. CHECK: guide S step 6 says "at max stop" for Y,
                                         ; but homey.g homes towards Y minimum. Confirm on your machine.
; Z is homed with the probe (G30 in homez.g).

; ---------------------------------------------------------------------------
; Z probe: BLTouch on io3 (guide Q step 8)
; ---------------------------------------------------------------------------
M950 S0 C"io3.out"                       ; BLTouch control = servo port 0. io3.out is shared with the 12864 display NeoPixel pin
M558 P9 C"io3.in" H5 R1 F120 T6000 A5 S0.02 B1 ; BLTouch; no pull-up on Duet 3 inputs; B1 = heaters off while probing
G31 P25 X2 Y42 Z1.843                    ; CHECK: probe offsets X2 Y42 and trigger height Z - do the paper test (guide T steps 1-2)
M557 X10:140 Y45:145 S20                 ; mesh grid for G29 (probe positions). CHECK: keep inside the reachable probe area

; ---------------------------------------------------------------------------
; Temperature sensors
; ---------------------------------------------------------------------------
M308 S0 P"temp0" Y"thermistor" A"Bed" T100000 B4240 C0          ; CHECK: bed thermistor beta (kit config B4240)
M308 S1 P"temp1" Y"thermistor" A"Hotend" T100000 B4725 C7.06e-8 ; E3D Revo HeaterCore thermistor (E3D's RRF values)
; RRF 3.5.3 improved Mini 5+ thermistor accuracy; Duet3D suggests recalibrating
; the inputs (M308 ... H/L) if you need the best accuracy.

; ---------------------------------------------------------------------------
; Heaters
; ---------------------------------------------------------------------------
; Bed: 24V DC silicone heater straight on OUT0 (guide Q step 2), no SSR.
M950 H0 C"out0" T0                       ; bed heater on OUT0, sensor 0
M140 H0                                  ; heater 0 is the bed (must come before M143 H0)
M307 H0 B0 S1.00                         ; CHECK: placeholder. Run M303 H0 S90 and paste the M307 line it prints here
M143 H0 S110                             ; CHECK: bed maximum temperature (conservative: the heater is held on with adhesive)
M570 H0 P5 T15 R3                        ; heater fault if 15C off target for 5s, or 3 bad readings (RRF defaults, stated explicitly)

; Hot end: E3D Revo Micro on OUT1 (guide Q step 7)
M950 H1 C"out1" T1                       ; hot end heater on OUT1, sensor 1
M307 H1 B0 S1.00                         ; CHECK: placeholder. Run M303 T0 S250 and paste the M307 line it prints here
M143 H1 S285                             ; maximum hot end temperature (Revo is rated to 300C; 285 leaves margin)
M570 H1 P5 T15 R3                        ; heater fault if 15C off target for 5s, or 3 bad readings
; Note: the kit line "M570 S360" did NOT give the hot end extra heat-up time.
; S was a print-cancel timeout and was removed in RRF 3.4.2. Tune with M303 instead.

; ---------------------------------------------------------------------------
; Fans (guide Q step 6)
; ---------------------------------------------------------------------------
M950 F1 C"out4" Q500                     ; layer (part cooling) fan
M106 P1 C"Layer fan" S0 H-1              ; manual control, off
M950 F2 C"out5" Q500                     ; electronics bay (panel) fans
M106 P2 C"Panel fans" S1 H-1             ; always on
M950 F3 C"out6" Q500                     ; hot end (heatsink) fan. Revo Micro: via the kit 24V->5V buck converter
M106 P3 C"Hotend fan" S1 H1 T50          ; full speed whenever the hot end is above 50C. CHECK: buck converter is OK with on/off switching
; Safer option if unsure: make the hot end fan always on (remove H1 T50).

; ---------------------------------------------------------------------------
; Tool
; ---------------------------------------------------------------------------
M563 P0 S"Hotend" D0 H1 F1               ; tool 0: extruder 0, heater 1, layer fan 1
G10 P0 X0 Y0 Z0                          ; tool 0 offsets
M568 P0 R0 S0                            ; tool 0 standby/active temperatures (M568 replaces G10 S/R since RRF 3.3)
;M572 D0 S0.05                           ; CHECK: pressure advance - calibrate before enabling (RRF 3.6 may need less with input shaping)

; ---------------------------------------------------------------------------
; Input shaping (optional)
; ---------------------------------------------------------------------------
; Measure first (ringing tower or a Duet3D accelerometer). From RRF 3.7 an M593
; without P no longer turns shaping on, so always give P.
;M593 P"mzv" F50                         ; CHECK: shaper type and frequency for YOUR machine

; ---------------------------------------------------------------------------
; Finish
; ---------------------------------------------------------------------------
;M501                                    ; uncomment if you save tuning with M500 instead of editing this file
T0                                       ; select tool 0
