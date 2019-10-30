; #### Chamber Heater - Heater 3 N.B. this has not been tested yet
;M141 H3                                       ; heater 3 is the chamber heater 
;M305 P3 R4700 T100000 B3950                   ; heater 3 is monitored by a 100K thermistor with B=3950 and a 4.7K series resistor  (not enabled yet)
;M301 H3 B1                                    ; use bang-bang control for the chamber heater  
