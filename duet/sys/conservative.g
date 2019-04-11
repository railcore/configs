;File     : conservative.g
;Effect   : Slows down the printer, adjusts probing to give more leeway, puts in a default heater model.
;Use-case : Enabled by default, for use during commissioning in order to either prevent or minimise the effects
;           of crashing the head into the bed or anything else and to ensure there is a heater model before tuning.

; Axis and motor configuration - slow down.
M201 X1500 Y1500 Z10 E500      ; Reduce accelerations (mm/s^2)
M203 X12000 Y12000 Z450 E1800   ; Reduce maximum speeds (mm/min)
M566 X500 Y500 Z15 E10        ; Reduce maximum jerk speeds mm/minute

M558 H10 F50 T3000 ; Z probe - slow and raise probe height.
                   ; H10 - dive height
                   ; F50 - probing speed
                   ; T3000 - travel speed between probe points
                   ; A bigger dive height prevents a situation where the bed is out of alignment by more than the dive height
                   ; on any corner, which can crash the hot-end into the bed while moving the head in XY.
                   ; Probing speed and travel speed are similarly reduced in case the Z probe isn't connected properly (or
                   ; disconnects later after moving to a point) giving the user more time to stop.

; Default heater model
M307 H0 A270.7 C90.4 D6.7 B0 S1.0          ; Default Bed Heater Parameters, before tuning / if config-override.g is missing
M307 H1 A508.1 C249.0 D3.8 S1.00 V24.2 B0  ; Default Tool Heater Parameters, before tuning / if config-override.g is missing
