; config.g - RailCore II 300ZL / 300ZLT kit
; Duet 2 WiFi or Duet 2 Ethernet + DueX5, RepRapFirmware 3.5.x / 3.6.x
;
; Based on the "Duet2 RRF3" kit bundle in this repo, updated for RRF 3.5/3.6.
; RRF 3.6.x is the last release line for Duet 2 (RRF 3.7 dropped Duet 2).
; Lines marked "CHECK:" are values that must be verified on YOUR machine
; before printing. Read the README in this folder first.

; ---------------------------------------------------------------------------
; General
; ---------------------------------------------------------------------------
M111 S0                                  ; debug off
M550 P"RailCore"                         ; machine name (also the mDNS/NetBIOS name)
G21                                      ; work in millimetres
G90                                      ; absolute coordinates...
M83                                      ; ...but relative extruder moves

; ---------------------------------------------------------------------------
; Network
; ---------------------------------------------------------------------------
M552 S1                                  ; enable networking (WiFi: join the network saved with M587; Ethernet: DHCP)
M586 P0 S1                               ; enable HTTP (Duet Web Control)
M586 P1 S0                               ; FTP off
M586 P2 S0                               ; Telnet off
; Duet 2 Ethernet only: every Duet on a network needs a unique MAC address.
; Uncomment and set your own if you run more than one Duet 2 Ethernet.
;M540 P02:00:00:00:00:01                 ; CHECK: unique, locally administered MAC (Ethernet only)

M575 P1 S1 B57600                        ; PanelDue on the PanelDue connector (checksum required)

; ---------------------------------------------------------------------------
; Kinematics and drives
; ---------------------------------------------------------------------------
M669 K1                                  ; CoreXY (M667 was removed in RRF 3.5)

; Drive map (guide Q "Wiring the Electronics"):
;   0 = X / rear stepper (Duet X)       1 = Y / front stepper (Duet Y)
;   3 = extruder (Duet E0)              5 = Z front left (DueX E2)
;   6 = Z rear left (DueX E3)           7 = Z right (DueX E4)
; Directions below are the kit defaults; guide S "First Moves" says how to test
; and flip each one.
M569 P0 S0                               ; CHECK: X / rear stepper direction (guide S step 2)
M569 P1 S1                               ; CHECK: Y / front stepper direction (guide S step 3)
M569 P3 S0                               ; CHECK: extruder direction (guide T step 7)
M569 P5 S0                               ; CHECK: Z front left direction (guide S step 4)
M569 P6 S0                               ; CHECK: Z rear left direction
M569 P7 S0                               ; CHECK: Z right direction
M584 X0 Y1 Z5:6:7 E3                     ; map axes to drives (Z order matches M671 below)

; Leadscrew positions for G32 auto-levelling: front left, rear left, right.
; Measure your own to the centre of each leadscrew.
M671 X-10:-10:333 Y22.5:277.5:150 S7.5   ; CHECK: leadscrew X/Y positions; S7.5 = max correction (mm)

M350 X16 Y16 Z16 E16 I1                  ; 16x microstepping with interpolation (TMC2660 interpolates only at x16)
M92 X200 Y200 Z1600 E837                 ; steps/mm. CHECK: E837 is the kit BMG + pancake stepper value; calibrate your extruder
M906 X1400 Y1400 Z1000 E800 I60          ; motor currents (mA), 60% idle. CHECK: against your motors' rated current
M84 S30                                  ; idle timeout (s)

; Speeds, accelerations, jerk (kit values)
M203 X24000 Y24000 Z900 E3600            ; max speeds (mm/min)
M201 X3000 Y3000 Z100 E1500              ; max accelerations (mm/s^2)
M566 X1000 Y1000 Z100 E1500              ; max jerk (mm/min). RRF 3.6: M205 can no longer exceed these

; ---------------------------------------------------------------------------
; Axis limits
; ---------------------------------------------------------------------------
M208 X0 Y0 Z-0.5 S1                      ; axis minima
M208 X290 Y290 Z280 S0                   ; CHECK: axis maxima - measure yours (guide T step 3). 300ZLT: Z is much taller, measure it

; ---------------------------------------------------------------------------
; Endstops (X at rear left, Y on the carriage; both home to the low end)
; ---------------------------------------------------------------------------
M574 X1 S1 P"xstop"                      ; X endstop, low end, active high (NC switch). CHECK: M119 test (guide S step 5)
M574 Y1 S1 P"ystop"                      ; Y endstop, low end, active high (NC switch). CHECK: M119 test (guide S step 6)
; Z is homed with the probe (G30 in homez.g), so no Z endstop is defined.

; ---------------------------------------------------------------------------
; Z probe: BLTouch (kit default)
; Signal: Duet Z_PROBE IN. Servo/control: DueX PWM1 (guide Q steps 28-29).
; Note: DueX PWM1 shares its signal with the DueX E2 heater, so E2 heat must stay unused.
; ---------------------------------------------------------------------------
M950 S0 C"duex.pwm1"                     ; BLTouch servo/control = GPIO/servo port 0 (used by deployprobe.g / retractprobe.g)
M558 P9 C"^zprobe.in" H5 R1 F120 T6000 A5 S0.02 ; BLTouch, 5mm dive, 1s settle, 120mm/min probe (kit RRF3 used F50), up to 5 taps, 0.02mm tolerance
G31 P25 X2 Y42 Z2.65                     ; CHECK: probe offsets X2 Y42 (kit mount) and trigger height Z - do the paper test (guide T steps 1-2)
M557 X10:280 Y50:280 S30                 ; mesh grid for G29 (probe positions). CHECK: keep inside the reachable probe area

; Alternatives (comment out the BLTouch block above if you use one of these):
; IR probe (e.g. dc42 IR) on Z_PROBE IN:
;M558 P1 C"zprobe.in" H5 F120 T6000 A5 S0.02
;G31 P500 X0 Y30 Z2.00                   ; CHECK: offsets and trigger height
; Plain switch probe: RRF 3.5/3.6 use P5 (normally closed) or P4; RRF 3.7 deprecates P5 in favour of P8.
;M558 P5 C"^zprobe.in" H5 F120 T6000 A5 S0.02
;G31 P500 X0 Y0 Z0                       ; CHECK: offsets and trigger height

; ---------------------------------------------------------------------------
; Temperature sensors
; ---------------------------------------------------------------------------
; Bed: the thermistor in the bed channel (guide Q step 14). The Keenovo pad's own
; thermistor is NOT used for control.
M308 S0 P"bedtemp" Y"thermistor" A"Bed" T100000 B3950 C0  ; CHECK: bed thermistor beta. Duet2 RRF3 kit config used B3950, Duet3 kit config used B4240
; Hot end: E3D V6 with the stock E3D (Semitec 104GT) thermistor (guide M, Q step 21)
M308 S1 P"e0temp" Y"thermistor" A"Hotend" T100000 B4725 C7.06e-8 ; E3D thermistor (also the RRF 3.2+ default)
; Slice Engineering 500K thermistor instead (kits did NOT ship one):
;M308 S1 P"e0temp" Y"thermistor" A"Hotend" T500000 B4723 C1.19622e-7

; Optional second bed sensor: the Keenovo pad thermistor on DueX E4 TEMP (guide Q step 25),
; used only as an independent over-temperature monitor (see M143 H0 P1 below).
;M308 S2 P"duex.e4temp" Y"thermistor" A"Bed pad" T100000 B3950 C0 ; CHECK: Keenovo thermistor type

; ---------------------------------------------------------------------------
; Heaters
; ---------------------------------------------------------------------------
; Bed: Keenovo AC silicone pad switched by an SSR from the Duet BED output.
; RRF 3.x does not lower the PWM frequency for SSRs by itself, so set Q10 (10 Hz).
M950 H0 C"bedheat" T0 Q10                ; bed heater on BED output, sensor 0, 10 Hz for the SSR
M140 H0                                  ; heater 0 is the bed (required since RRF 3.1; must come before M143 H0)
M307 H0 B0 S1.00                         ; CHECK: placeholder. Run M303 H0 S100 and paste the M307 line it prints here
M143 H0 S120                             ; CHECK: bed maximum temperature (conservative; raise only if every part of your bed is rated for it)
M570 H0 P5 T15 R3                        ; heater fault if 15C off target for 5s, or 3 bad readings (RRF defaults, stated explicitly)
;M143 H0 P1 T2 S130 A0                   ; optional: heater fault if the Keenovo pad thermistor (sensor 2) reads over 130C

; Hot end: E3D V6 heater cartridge on E0 HEAT
M950 H1 C"e0heat" T1                     ; hot end heater on E0 HEAT, sensor 1
M307 H1 B0 S1.00                         ; CHECK: placeholder. Run M303 T0 S250 and paste the M307 line it prints here
M143 H1 S285                             ; maximum hot end temperature (E3D V6 limit)
M570 H1 P5 T15 R3                        ; heater fault if 15C off target for 5s, or 3 bad readings (RRF defaults, stated explicitly)
; Note: the old kit line "M570 S360" did NOT give the hot end extra heat-up time.
; S was a print-cancel timeout (minutes) and was removed in RRF 3.4.2. A slow
; heat-up is fixed by tuning (M303), not by loosening fault detection.

; ---------------------------------------------------------------------------
; Fans
; ---------------------------------------------------------------------------
; Kit wiring: hot end (heatsink) fan on an ALWAYS-ON header (not controlled by
; firmware), layer fan on FAN0 (guide Q steps 23-24).
M950 F0 C"fan0" Q500                     ; layer (part cooling) fan
M106 P0 C"Layer fan" S0 H-1              ; manual control, off
M950 F1 C"fan1" Q500                     ; spare
M106 P1 S0 H-1                           ; off
M950 F2 C"fan2" Q500                     ; spare
M106 P2 S0 H-1                           ; off
; If you moved the hot end fan to FAN1, make it thermostatic instead:
;M106 P1 C"Hotend fan" S1 H1 T45         ; on at full speed when the hot end is above 45C

; ---------------------------------------------------------------------------
; Tool
; ---------------------------------------------------------------------------
M563 P0 S"Hotend" D0 H1 F0               ; tool 0: extruder 0, heater 1, layer fan 0
G10 P0 X0 Y0 Z0                          ; tool 0 offsets
M568 P0 R0 S0                            ; tool 0 standby/active temperatures (M568 replaces G10 S/R since RRF 3.3)
;M572 D0 S0.05                           ; CHECK: pressure advance - calibrate before enabling

; ---------------------------------------------------------------------------
; Input shaping (optional)
; ---------------------------------------------------------------------------
; Measure your ringing frequency first (ringing tower or accelerometer), then enable.
;M593 P"mzv" F40                         ; CHECK: shaper type and frequency for YOUR machine

; ---------------------------------------------------------------------------
; Finish
; ---------------------------------------------------------------------------
;M501                                    ; uncomment if you save tuning with M500 instead of editing this file
T0                                       ; select tool 0
