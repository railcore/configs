;unload ABS
G10 S230 ; Set current tool temperature

M116 ; Wait for the temperatures to be reached
G1 E-20 F300 ; Retract 20mm of filament at 300mm/min
G10 S230
G1 E-480 F3000 ; Retract 480mm of filament at 3000mm/min
M400 ; Wait for the moves to finish
M84 E0:1 ; Turn off extruder drives 1 and 2