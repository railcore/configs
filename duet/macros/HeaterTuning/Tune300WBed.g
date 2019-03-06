; Macro to automatically tune the heated bed with a 300W silicone bed heater.
M291 P"Please wait 60 minutes while the printer bed is heated to 75C, cooled and calibrated." R"Tune Bed Heater 300W" S0 T3   ; Display message
M303 H0 S75     ; auto tune heater 0, default PWM, 75C target or maximum temperature
G4 S3600        ; wait 60 minutes
M307 H0         ; show results
M500            ; save results
M291 P"Heated bed should now be calibrated." R"Tune Bed Heater" S2   ; Display message and wait.
