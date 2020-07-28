;load TPU
T0
G10 S230 ; Heat up the current tool to 250C enough for PETG
M116 ; Wait for the temperatures to be reached
G1 E100 F3000 ; Extrude 100mm of filament at 3000mm/min
G1 E20 F300 ; Extrude 20mm of filament at 300mm/min

M400 ; Wait for the moves to finish
M84 E0 ; Turn off extruder drive