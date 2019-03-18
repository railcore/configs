M584 X0 Y1 Z5:6:7 E3:4:8:9 		; Map Z to drivers 5, 6, 7. Define unused drivers 3,4,8 and 9 as extruders
M569 P0 S0                          ; Drive 0 goes backwards (change to S1 to reverse it) X stepper
M569 P1 S1                          ; Drive 1 goes forwards	Y Stepper
M569 P2 S1                          ; Drive 2 goes forwards		Unused
M569 P3 S0                          ; Drive 3 goes backwards		Extruder 
M569 P4 S1                          ; Drive 4 goes forwards 		Extruder (unused)
M569 P5 S0							; Drive 5 goes backwards	Front Left Z
M569 P6 S0							; Drive 6 goes backwards	Rear Left Z
M569 P7 S0							; Drive 7 goes backwards	Right Z

M906 X1400 Y1400 Z1000 E1250 I60 ; Set motor currents (mA)