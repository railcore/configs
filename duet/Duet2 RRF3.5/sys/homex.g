; homex.g - home X (RailCore II 300ZL/ZLT, Duet 2, RRF 3.5/3.6)
; X endstop is at the rear left (X minimum).
G91                      ; relative positioning
G1 H2 Z4 F200            ; lift Z 4mm (H2 = move even if Z is not homed)
G1 H1 X-320 F3000        ; fast move towards the X endstop, stop when it triggers. CHECK: longer than your X travel
G1 X4 F600               ; back off 4mm
G1 H1 X-10 F360          ; slow second approach
G1 H2 Z-4 F200           ; lower Z again
G90                      ; absolute positioning
