; Configuration file for RailcoreII 300ZL or ZLT Printer
; Debugging
M111 S0                                 ; Debug off
M929 P"eventlog.txt" S1                 ; Start logging to file eventlog.txt
M550 P"RailCore"                        ; Machine name and Netbios name (can be anything you like)
;M551 P"myrap"                          ; Machine password (used for FTP)

M98 P"wifi.g"                           ; Run WiFi configuration file.
M552 P0.0.0.0                           ; Use DHCP

;M586 P0 S1                             ; Enable HTTP (default) S0 to disable
;M586 P1 S0                             ; Disable FTP (default) S1 to enable
;M586 P2 S0                             ; Disable Telnet (default) S1 to enable

; General preferences
M555 P2                                 ; Set output to look like Marlin
M575 P1 B57600 S1                       ; Comms parameters for PanelDue
G21                                     ; Work in millimetres
G90                                     ; Send absolute coordinates...
M83                                     ; ...but relative extruder moves

; Axis and motor configuration
M669 K1                                 ; CoreXY mode

; Drives
M584 X0 Y1 Z5:6:7 E3:4:8:9  ; Map Z to drivers 5, 6, 7. Define unused drivers 3,4,8 and 9 as extruders
M569 P0 S0                  ; Drive 0 goes forwards (change to S0 to reverse it)| X stepper
M569 P1 S1                  ; Drive 1 goes backwards(change to S1 to reverse it)| Y Stepper
M569 P2 S1                  ; Drive 2 goes forwards                             | Unused
M569 P3 S1                  ; Drive 3 goes forwards                             | Extruder S1 for Bondtech, S0 for Titan
M569 P4 S1                  ; Drive 4 goes forwards                             | Extruder (unused)
M569 P5 S0                  ; Drive 5 goes backwards                            | Front Left Z
M569 P6 S0                  ; Drive 6 goes backwards                            | Rear Left Z
M569 P7 S0                  ; Drive 7 goes backwards                            | Right Z

;Leadscrew locations
M671 X-10:-10:333 Y22.5:277.5:150 S7.5 ;Front left,(-10,22.5) Rear Left (-10.,227.5) , Right (333,160) S7.5 is the max correction - measure your own offsets, to the bolt for the yoke of each leadscrew

; Axis and motor configuration
M350 X16 Y16 Z16 E16 I1                 ; Set 16x microstepping for axes & extruder, with interpolation.
M574 X1 Y1 Z0 S1                        ; Set homing switch configuration (x,y at min, z at max) IF YOU NEED TO REVERSE YOUR HOMING SWITCHES CHANGE S1 to S0
M906 X1000 Y1000 Z1000 E700 I60         ; Set motor currents (mA)
M201 X3000 Y3000 Z20 E1000              ; Accelerations (mm/s^2)
M203 X24000 Y24000 Z900 E3600           ; Maximum speeds (mm/min)
M566 X1000 Y1000 Z30 E20                ; Maximum jerk speeds mm/minute
M92 X200 Y200 Z1600 E837                ; Steps/mm

; Set axis minima:maxima switch positions (Adjust to suit your machine and to make X=0 and Y=0 the edges of the bed)
; These values are conservative to start with, adjust during commissioning.
; M208 X0:230 Y0:230 Z-0.2:230          ; 250ZL
M208 X0:280 Y0:280 Z-0.2:280            ; 300ZL
; M208 X0:280 Y0:280 Z-0.2:580          ; 300ZLT

; Thermistors
M305 P0 T100000 B4240 R4700 H0 L0       ; Put your own H and/or L values here to set the bed thermistor ADC correction
M305 P1 T100000 B4240 R4700 H0 L0       ; Put your own H and/or L values here to set the first nozzle thermistor ADC correction

;Heaters
M570 S360                                  ; Print will be terminated if a heater fault is not reset within 360 minutes.
M143 H0 S120                               ; Maximum H0 (Bed) heater temperature
M143 H1 S285                               ; Maximum H1 (Extruder) heater temperature

; Fans
M106 P0 H-1                             ; Disable thermostatic mode for fan 0
M106 P1 H-1                             ; Disable thermostatic mode for fan 1
M106 P2 H-1                             ; Disable thermostatic mode for fan 2
M106 P0 S0                              ; Turn off fans
M106 P1 S0
M106 P2 S0

; Tool definitions
M563 P0 D0 H1                           ; Define tool 0
G10 P0 S0 R0                            ; Set tool 0 operating and standby temperatures
;*** If you have a single-nozzle build, leave the next 2 lines commented out.
;M563 P1 D1 H2                          ; Define tool 1
;G10 P1 S0 R0 X0 Y17                    ; Set tool 1 operating and standby temperatures

; Z probe and compensation definition

;*** Any file commented out with semi-colons is deactivated.
;*** Do not use the Fxxx parameter for M558 in these files, as it is set in homez.g
;*** WARNING - **Always** make sure your cables are correct, secure and test them thoroughly before homing Z for the first times!

M98 P"zprobe/ir.g"                       ; Run IR Probe configuration file.
;M98 P"zprobe/switch.g"                  ; Run Switch Probe configuration file. (untested/community submitted)
;M98 P"zprobe/bltouch.g"                 ; Run BLTouch configuration file.
;M98 P"zprobe/orion.g"                   ; Run Piezo Orion configuration file (untested/community submitted)

; *** Conservative settings enabled during build and testing. When you are ready to remove this ***
; *** simple protection, remove or comment out this line                                        ***
M98 P"conservative.g"

T0                                      ; select first hot end
M501                                    ; Load saved parameters from non-volatile memory
