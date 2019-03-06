M291 P"Please wait 5 minutes while the T0/H1 is heated to 240C, cooled and calibrated." R"Tune T0/H1" S0 T3   ; Display message
M303 H1 S240	; auto tune heater 1, default PWM, 240C target or maximum temperature
G4 S300         ; wait 5 minutes
M307 H1 		; show results
M500 			; save results
M291 P"T0/H1 should now be calibrated." R"Tune T0/H1" S2   ; Display message and wait.


