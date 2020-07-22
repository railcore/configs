;File     : conservative.g
;Effect   : Slows down the printer, adjusts probing to give more leeway, puts in a default heater model.
;Use-case : Enabled by default, for use during commissioning in order to either prevent or minimise the effects
;           of crashing the head into the bed or anything else and to ensure there is a heater model before tuning.

; Axis and motor configuration - slow down.
M906 X500 Y500 Z400 E700 I60 ; Reduce motor currents (mA) - WARNING: May trigger stallguard (and prematurely during homing) if sensorless.
M201 X500 Y500 Z02 E500      ; Accelerations (mm/s^2)
M203 X3000 Y3000 Z50 E1800   ; Maximum speeds (mm/min)
M566 X200 Y200 Z5 E10        ; Maximum jerk speeds mm/minute

M558 H10           ; Z probe - raise probe height.
                   ; H10 - dive height
                   ; A bigger dive height prevents a situation where the bed is out of alignment by more than the dive height
                   ; on any corner, which can crash the hot-end into the bed while moving the head in XY.
                   ; Probing speed and travel speed are similarly reduced in case the Z probe isn't connected properly (or
                   ; disconnects later after moving to a point) giving the user more time to stop.

; Default heater model
M307 H0 A270.7 C90.4 D6.7 B0 S1.0          ; Default Bed Heater Parameters, before tuning / if config-override.g is missing
M307 H1 A508.1 C249.0 D3.8 S1.00 V24.2 B0  ; Default Tool Heater Parameters, before tuning / if config-override.g is missing
