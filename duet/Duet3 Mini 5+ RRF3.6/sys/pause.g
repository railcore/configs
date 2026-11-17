; pause.g - run when a print is paused
M83                      ; relative extruder moves
G1 E-2 F2500             ; retract 2mm
G91                      ; relative positioning
G1 Z5 F600               ; raise the nozzle 5mm
G90                      ; absolute positioning
G1 X25 Y25 F6000         ; move the head out of the way
