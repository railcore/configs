G10 S230 ; Set current tool temperature
M116 ; Wait for the temperatures to be reached
G1 E380 F3000 ; Feed 380mm of filament at 3000mm/min
G1 E73 F300 ; Feed 25mm of filament at 300mm/min
G4 P1000 ; Wait one second
G1 E-10 F1800 ; Retract 10mm of filament at 1800mm/min
M400 ; Wait for moves to complete