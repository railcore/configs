; Z probe and compensation definition
; *** WARNING - **Always** make sure your cables are correct, secure and test them thoroughly before homing Z for the first times!
; INSTRUCTIONS :    1) Uncomment your configuration lines
					2) M558 *** Do not add the Fxxx parameter for M558 here, it is set in homez.g
					3) G31 
					; a) Customize your offsets appropriately, where the probe is X Y is offset from the nozzle.
					; Z is the trigger height (how high your nozzle is from the bed when the probe triggers). You need to dial those in.
                    ; Tip: A larger trigger height in G31 moves you CLOSER to the bed
					
M558 P1                 ; IR probe Probing configuration          
G31 X0 Y35 Z2.00 P500   ; IR probe Probing configuration

M558 H5 A3 T6000        ; Set 5mm dive height, 3 probes and 6000 travel speed.


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


; Set axis minima:maxima switch positions (Adjust to suit your machine and to make X=0 and Y=0 the edges of the bed)
;M208 X0:250 Y0:250 Z-0.2:230          ; 250ZL
;M208 X0:300 Y0:300 Z-0.2:330          ; 300ZL
;M208 X0:300 Y0:300 Z-0.2:610          ; 300ZLT


;M557 X30:290 Y30:290 S260 S260          ; Set Default Mesh