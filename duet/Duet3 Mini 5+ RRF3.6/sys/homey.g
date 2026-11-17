; homey.g - home Y (RailCore Mini, Duet 3 Mini 5+, RRF 3.6/3.7)
; Homes towards Y minimum (M574 Y1). CHECK: see the Y endstop note in config.g.
G91                      ; relative positioning
G1 H2 Z5 F200            ; lift Z 5mm
G1 H1 Y-200 F3000        ; fast move towards the Y endstop
G1 Y4 F600               ; back off 4mm
G1 H1 Y-10 F360          ; slow second approach
G1 H2 Z-5 F200           ; lower Z again
G90                      ; absolute positioning
