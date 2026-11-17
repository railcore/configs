; homey.g - home Y (RailCore II 300ZL/ZLT, Duet 2, RRF 3.5/3.6)
; Y endstop is on the carriage and triggers against the front (Y minimum).
G91                      ; relative positioning
G1 H2 Z4 F200            ; lift Z 4mm
G1 H1 Y-320 F3000        ; fast move towards the Y endstop. CHECK: longer than your Y travel
G1 Y4 F600               ; back off 4mm
G1 H1 Y-10 F360          ; slow second approach
G1 H2 Z-4 F200           ; lower Z again
G90                      ; absolute positioning
