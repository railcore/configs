;File     : config-user.g
;Effect   : Provides a custom configuration area for the railcore user.
;Use-case : By keeping any custom definitions in this file (such as Z probe attributes, axis minima/maxima and anything else that you wish to override in config.g
;         : it will enable the user to easily keep track of their own changes to the default config, as well as provide a simple upgrade path for future Github releases.
;         *** Feel free to delete anything in here that you are not using. ***

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


; Project R3D config
;M584 X0 Y1 Z5:6:7 E3:4:8:9 		; Map Z to drivers 5, 6, 7. Define unused drivers 3,4,8 and 9 as extruders
;M569 P0 S0                         ; Drive 0 goes backwards (change to S1 to reverse it) X stepper
;M569 P1 S1                         ; Drive 1 goes forwards	Y Stepper
;M569 P2 S1                         ; Drive 2 goes forwards		Unused
;M569 P3 S0                         ; Drive 3 goes backwards		Extruder 
;M569 P4 S1                         ; Drive 4 goes forwards 		Extruder (unused)
;M569 P5 S0							; Drive 5 goes backwards	Front Left Z
;M569 P6 S0							; Drive 6 goes backwards	Rear Left Z
;M569 P7 S0							; Drive 7 goes backwards	Right Z
;M906 X1400 Y1400 Z1000 E1250 I60   ; Set motor currents (mA)

M558 H10           ; Z probe - raise probe height.
                   ; H10 - dive height
                   ; A bigger dive height prevents a situation where the bed is out of alignment by more than the dive height
                   ; on any corner, which can crash the hot-end into the bed while moving the head in XY.
                   ; Probing speed and travel speed are similarly reduced in case the Z probe isn't connected properly (or
                   ; disconnects later after moving to a point) giving the user more time to stop.
				   
; Axis and motor configuration - slow down.
M906 X1000 Y1000 Z1000 E700 I60         ; Set motor currents (mA)
M201 X3000 Y3000 Z20 E1000              ; Accelerations (mm/s^2)
M203 X24000 Y24000 Z900 E3600           ; Maximum speeds (mm/min)
M566 X1000 Y1000 Z30 E20                ; Maximum jerk speeds mm/minute
;M92 E837                               ; Extruder - Titan Extruder Steps/mm (Standard Titan stepper 42BYGHM208P4.5-15-X2 @ 0.9deg/step)

; Set axis minima:maxima switch positions (Adjust to suit your machine and to make X=0 and Y=0 the edges of the bed)
; M208 X0:250 Y0:250 Z-0.2:230          ; 250ZL
; M208 X0:300 Y0:300 Z-0.2:330          ; 300ZL
; M208 X0:300 Y0:300 Z-0.2:610          ; 300ZLT

; Tool definitions
;*** If you have a dual-nozzle build, uncomment.
;M563 P1 D1 H2                          ; Define tool 1
;G10 P1 S0 R0 X0 Y17                    ; Set tool 1 operating and standby temperatures

T0                                      ; select first hot end