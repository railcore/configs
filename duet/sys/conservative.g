; Axis and motor configuration
M201 X3000 Y3000 Z20 E1000      ; Accelerations (mm/s^2)
M203 X24000 Y24000 Z900 E3600   ; Maximum speeds (mm/min)
M566 X1000 Y1000 Z30 E20        ; Maximum jerk speeds mm/minute

; Heater model
M307 H1 A270.7 C90.4 D6.7 B0 S1.0	; Default heater 1 model, run tuning!