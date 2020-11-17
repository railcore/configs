;load PETG
T0
G10 S255 R160 ; Heat up the current tool to 260C enough for PETG first layer
M116          ; Wait for the temperatures to be reached
G1 E70 F3000  ; Extrude 70mm of filament at 3000mm/min
G1 E80 F300   ; Extrude 80mm of filament at 300mm/min - purge hotend

M400          ; Wait for the moves to finish
M84 E0        ; Turn off extruder drive
