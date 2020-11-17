M291 P"Please wait 5 minutes while the T0/H1 is heated to 260C, cooled and calibrated." R"Tune T0/H1" S0 T3   ; Display message
M106 S128
M303 H1 S260	; auto tune heater 1, default PWM, 260C target or maximum temperature
M291 P"Wait for tuning to finish" R"Tune T0/H1" S2   ; Display message and wait.


