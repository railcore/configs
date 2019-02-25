M303 H1 S240 ; auto tune heater 1, default PWM, 260C target or maximum temperature
G4 S300; wait 5 minutes
M307 H1 ;  show results
M500 ; save result
