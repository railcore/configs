; Configuration file for RailCore II 250ZL
; Communication and general
M111 S0                             ; Debug off
M550 PRailCore250ZL                 ; Machine name and Netbios name (can be anything you like)
;M551 Pmyrap                        ; Machine password (used for FTP)
;*** If you have more than one Duet on your network, they must all have different MAC addresses, so change the last digits
M540 P0xBE:0xEF:0xDE:0xAD:0xFE:0xEE ; MAC Address

; Wifi Networking
M552 S1                             ; Enable WiFi
M587 S"SSID_HERE" P"PASSWORD_HERE"
M552 P0.0.0.0                       ; Use DHCP
M555 P2                             ; Set output to look like Marlin
M575 P1 B57600 S1                   ; Comms parameters for PanelDue

G21                                 ; Work in millimetres
G90                                 ; Send absolute coordinates...
M83                                 ; ...but relative extruder moves

; Axis and motor configuration
M584 X0 Y1 Z5:6:7 E3:4:8:9 ; Map Z to drivers 5, 6, 7 ; Define unused drivers 3,4,8 and 9 as extruders
M667 S1                             ; CoreXY mode
M569 P0 S0                          ; Drive 0 goes backwards (change to S1 to reverse it)
M569 P1 S1                          ; Drive 1 goes forwards
M569 P2 S1                          ; Drive 2 goes forwards
M569 P3 S0                          ; Extruder (Drive 3) S1 for Bondtech, S0 for Titan
M569 P4 S1                          ; Drive 4 goes forwards
M569 P5 S0                          ; Drive 5 goes backwards
M569 P6 S0                          ; Drive 6 goes backwards
M569 P7 S0                          ; Drive 7 goes backwards

;Leadscrew locations
M671 X-10:-10:273  Y24:228:122 S7.5 ; Calibrated Front left, Rear Left, Right  S7.5 is the max correction


M350 X16 Y16 Z16 E16 I1             ; set 16x microstepping for axes& extruder, with interpolation
; Sensorless Homing
M574 X1 Y1 S3                       ; set sensorless homing for X/Y
M574 Z0 S0                          ; set sensored homing for Z( z at max)
; Endstop Switch Homing
; M574 X1 Y1 Z0 S0                  ; set homing switch configuration (x,y at min, z at max)
M906 X1000 Y1000 Z1000 E700 I60 ; Set motor currents (mA)
M201 X3000 Y3000 Z20 E1000          ; Accelerations (mm/s^2)
M203 X24000 Y24000 Z900 E3600       ; Maximum speeds (mm/min)
M566 X1000 Y1000 Z30 E20            ; Maximum jerk speeds mm/minute
M208 X220 Y240 Z230                 ; set axis maxima and high homing switch positions (adjust to suit your machine)
M208 X0 Y0 Z-0.5 S1                 ; set axis minima and low homing switch positions (adjust to make X=0 and Y=0 the edges of the bed)
M92 X201.5 Y201.5 Z1600 E406        ; steps/mm

; Thermistors
M305 P0 T100000 B4240 R4700 H0 L0   ; Put your own H and/or L values here to set the bed thermistor ADC correction
M305 P1 T100000 B4240 R4700 H0 L0   ; Put your own H and/or L values here to set the first nozzle thermistor ADC correction

M307 H0 A92.4 C462.7 D5.9 S1.00 V24.2 B0  ; Heated Bed (H0) PID tuning settings
M307 H1 A351.9 C170.9 D6.2 S1.00 V24.3 B0 ; Hotend (H1) PID tuning settings
M570 S360                           ; Hot end may be a little slow to heat up so allow it 180 seconds
M143 S320

; Fans
M106 P0 H-1                         ; disable thermostatic mode for fan 0
M106 P1 H-1                         ; disable thermostatic mode for fan 1
M106 P2 H-1
M106 P0 S0                          ; turn off fans
M106 P1 S0
M106 P2 S0

; Tool definitions
M563 P0 D0 H1                       ; Define tool 0
G10 P0 S0 R0                        ; Set tool 0 operating and standby temperatures
; Uncomment for Duet Laser Filament Monitor
M591 D0 P5 C3 R40:120 E3.0 S0       ; laser filament monitor
;*** If you have a single-nozzle build, comment the next 2 lines
;M563 P1 D1 H2                      ; Define tool 1
;G10 P1 S0 R0 X0 Y17                ; Set tool 1 operating and standby temperatures
;M92 E837                           ;titan steps/mm
;M92 E663:663                       ; Set extruder steps per mm

; Z probe and compensation definition
;*** If you have a switch instead of an IR probe, change P1 to P4 in the following M558 command
; IR Probe Config
M558 P1 X0 Y0 Z1                    ; Z probe is an IR probe and is not used for homing any axes
G31 X7 Y37 Z1.56 P500               ; Set the zprobe height and threshold (put your own values here)

; BLTouch Config
;M307 H3 A-1 C-1 D-1
;M558 P5 X0 Y0 Z1 H5 F50 T2000 A5 S0.02  ;1.20
;M558 P9 X0 Y0 Z1 H5 F50 T6000 A5 S0.02  ;1.21rc3

;G31 X2 Y42 Z2.65 P25 ; 2.62

M208 S1 Z-0.2                       ; set minimum Z
;
T0                                  ; select first hot end
