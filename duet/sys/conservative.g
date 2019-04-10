; Axis and motor configuration
M201 X1500 Y1500 Z10 E500      ; Accelerations (mm/s^2)
M203 X12000 Y12000 Z450 E1800   ; Maximum speeds (mm/min)
M566 X500 Y500 Z15 E10        ; Maximum jerk speeds mm/minute

; Heater model
M307 H0 A270.7 C90.4 D6.7 B0 S1.0          ; Default Bed Heater Parameters, before tuning
M307 H1 A508.1 C249.0 D3.8 S1.00 V24.2 B0  ; Default Tool Heater Parameters, before tuning

M558 H10 F50 T3000 ; Z probe
                   ; H10 - dive height
                   ; F50 - probing speed
                   ; T3000 - travel speed between probe points
                   ; Bigger dive height prevents a situation where the bed is offset by more than the dive height
                   ; on any corner during commissioning, crashing the hot-end.
                   ; Probing speed and travel speed are similarly reduced in case the Z probe isn't connected properly (or
                   ; disconnects later after moving to a point)
