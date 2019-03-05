M303 H0 S100  ; auto tune heater 1, default PWM, 240C target or maximum temperature
G4 S1800      ; wait 30 minutes for bed to heat up and cool down
M307 H0       ; show results
M500          ; save result
