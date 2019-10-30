; #### Electronics Cabinet
; MCU temperature is defined by firmware as virtual heater 100
; TMC2660 driver overheat flags are defined by firmware as virtual heaters 101 and 102
M106 P7 T35:55 H100:101:102 C"Elec.Cab.1" ; Electronics cooling fan that starts to turn on when the MCU temperature (virtual heater 100) reaches 45C 
M106 P8 T35:55 H100:101:102 C"Elec.Cab.2" ; and reaches full speed when the MCU temperature reaches 65C or if any TMC2660 drivers 
                                          ; (virtual heaters 101 and 102) report that they are over-temperature
                                          ; F parameter is ignored for fans connected to the fan outputs of a Duex 2 or Duex 5 because those 
                                          ; outputs don't support variable PWM frequency.
                                          ; (N.B. If a fan is configured to trigger on a virtual heater whose sensor represents TMC2660 driver over-temperature 
                                          ; flags, then when the fan turns on it will delay the reporting of an over-temperature warning for the corresponding drivers
                                          ; for a few seconds, to give the fan time to cool the driver down.)
