; Macro to automatically tune the heated bed with a silicone bed heater.
M291 P"Please wait 30 minutes while the printer bed is heated to 110C, cooled and calibrated. Then save results." R"Tune Bed Heater 110C" S0 T3   ; Display message
M303 H0 S110     ; auto tune heater 0, default PWM, 110C target or maximum temperature

