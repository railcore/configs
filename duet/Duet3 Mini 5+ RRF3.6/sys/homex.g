; homex.g - home X (RailCore Mini, Duet 3 Mini 5+, RRF 3.6/3.7)
; X endstop is at the rear right (X maximum, M574 X2).
G91                      ; relative positioning
G1 H2 Z5 F200            ; lift Z 5mm (H2 = move even if Z is not homed)
G1 H1 X200 F3000         ; fast move towards the X endstop, stop when it triggers
G1 X-4 F600              ; back off 4mm
G1 H1 X10 F360           ; slow second approach
G1 H2 Z-5 F200           ; lower Z again
G90                      ; absolute positioning
