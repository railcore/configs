;Commented out until tested.
;unload PLA

;G10 S215 ; Heat up the current tool to 215C
;M116 ; Wait for the temperatures to be reached
;G1 E-20 F300 ; Retract 20mm of filament at 300mm/min
;G1 E-440 F3000 ; Retract 480mm of filament at 3000mm/min
;M400 ; Wait for the moves to finish
;M84 E0:1 ; Turn off extruder drives 1 and 2