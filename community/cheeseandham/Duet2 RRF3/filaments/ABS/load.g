;load ABS
T0
G10 S250 ; Heat up the current tool to 210C, plenty for PLA and to purge any higher temp materials
M116 ; Wait for the temperatures to be reached
G1 E70 F3000 ; Extrude 70mm of filament at 3000mm/min
G1 E80 F300 ; Extrude 80mm of filament at 300mm/min - purge hotend

M400 ; Wait for the moves to finish
M84 E0 ; Turn off extruder drive