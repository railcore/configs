M303 H0 S100	; auto tune heater 1, default PWM, 240C target or maximum temperature
G4 S900			; wait 15 minutes
M307 H0 		; show results
M500 			; save result
