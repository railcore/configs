; homez.g - home Z with the BLTouch (RailCore Mini, Duet 3 Mini 5+, RRF 3.6/3.7)
if !move.axes[0].homed || !move.axes[1].homed
  M98 P"homey.g"
  M98 P"homex.g"
G91                      ; relative positioning
G1 H2 Z5 F800            ; lift Z 5mm before moving
G90                      ; absolute positioning
G1 X73 Y33 F6000         ; nozzle position that puts the probe (X+2 Y+42) at the bed centre
G30                      ; probe the bed and set Z
G1 Z10 F600              ; lift to Z10
