;File     : config-user.g
;Effect   : Provides a custom configuration area for the railcore user.
;Use-case : By keeping any custom definitions in this file (such as Z probe attributes, axis minima/maxima and anything else that you wish to override in config.g
;         : it will enable the user to easily keep track of their own changes to the default config, as well as provide a simple upgrade path for future Github releases.
;         *** Uncomment any lines pertinent to your configuration and            ***
;         *** feel free to delete anything in here that you are not using.       ***
;         **************************************************************************
; Z probe and compensation definition
; *** WARNING - **Always** make sure your cables are correct, secure and test them thoroughly before homing Z for the first times!
; INSTRUCTIONS :    1) Uncomment your configuration lines
					2) M558 *** Do not add the Fxxx parameter for M558 here, it is set in homez.g
					3) G31 
					; a) Customize your offsets appropriately, where the probe is X Y is offset from the nozzle.
					; Z is the trigger height (how high your nozzle is from the bed when the probe triggers). You need to dial those in.
                    ; Tip: A larger trigger height in G31 moves you CLOSER to the bed

;M558 P9                 ; BL-touch 
;G31 X2 Y42 Z2.65 P25    ; BL-touch 
;M307 H3 A-1 C-1 D-1     ; BL-touch : remaps some channels to make the PWM port on the Duex5 work for a Z-probe if you use a different PWM port than the docs show, you have to change that

;M558 P1                 ; IR probe Probing configuration          
;G31 X0 Y35 Z2.00 P500   ; IR probe Probing configuration

;M558 P8 I1 R0.75 S0.005 ; Orion *** WARNING: This section has not been tested throughly yet, and is based off community input. Use at your own risk.
;G31 X0 Y0  Z0.00 P500   ; Orion Probing configuration

;M558 P4                 ; Switch Probing configuration
;G31 X0 Y30 Z2.00 P500   ; Switch Probing configuration

; Z probe
;M558 H5 A3 T6000        ; Set 5mm dive height, 3 probes and 6000 travel speed.

; Drives
;M569 P3 S0                              ; Project R3D : Drive 3 goes backwards - Extruder 

; Axis and motor configuration - Faster speeds, so uncomment only when fully commissioned!
;M906 X1000 Y1000 Z1000 E700 I60         ; Set stock motor currents (mA)
;M906 X1400 Y1400 Z1000 E1250 I60        ; Project R3D : Set motor currents (mA)
;M201 X3000 Y3000 Z20 E1000              ; Accelerations (mm/s^2)
;M203 X24000 Y24000 Z900 E3600           ; Maximum speeds (mm/min)
;M566 X1000 Y1000 Z30 E20                ; Maximum jerk speeds mm/minute

; Leadscrew motor configuration
; M92 Z3200                               ; Steps/mm for Z - TR8*2 / 0.9 deg stepper 
; M92 Z800                                ; Steps/mm for Z - TR8*4 / 1.8 deg stepper or TR8*8 / 0.9 deg stepper

; Extruder
;M92 E837                                ; Extruder - Titan Extruder Steps/mm (Standard Titan stepper 42BYGHM208P4.5-15-X2 @ 0.9deg/step)

; Set axis minima:maxima switch positions (Adjust to suit your machine and to make X=0 and Y=0 the edges of the bed)
;M208 X0:250 Y0:250 Z-0.2:230          ; 250ZL
;M208 X0:300 Y0:300 Z-0.2:330          ; 300ZL
;M208 X0:300 Y0:300 Z-0.2:610          ; 300ZLT

; Tool definitions
;*** If you have a dual-nozzle build, uncomment.
;M563 P1 D1 H2                          ; Define tool 1
;G10 P1 S0 R0 X0 Y17                    ; Set tool 1 operating and standby temperatures

;T0                                      ; select first hot end

; Communications
; FTP
;M586 P1 S0                             ; Disable FTP (default) S1 to enable
;M551 P"myrap"                          ; Machine password (used for FTP)
; Telnet
;M586 P2 S0                             ; Disable Telnet (default) S1 to enable