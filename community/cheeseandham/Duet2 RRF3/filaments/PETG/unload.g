;unload PETG
T0
G10 S250 ; Heat up the current tool to 250C enough for PETG
M116 ; Wait for the temperatures to be reached
G1 E-20 F300 ; Retract 20mm of filament at 300mm/min
G1 E-200 F3000 ; Retract 200mm of filament at 3000mm/min
M400 ; Wait for the moves to finish
M84 E0 ; Turn off extruder drive