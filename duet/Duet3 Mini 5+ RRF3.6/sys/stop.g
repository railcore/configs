; stop.g - run by M0 at the end of a print (and by M1 since RRF 3.5)
; Most slicer end G-code already does this; it is a safety net.
M568 P0 A0               ; tool 0 heaters off
M140 S-273.1             ; bed heater off
M106 P1 S0               ; layer fan off
