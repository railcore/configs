; homez.g - home Z with the probe (RailCore II 300ZL/ZLT, Duet 2, RRF 3.5/3.6)
if !move.axes[0].homed || !move.axes[1].homed
  M98 P"homex.g"
  M98 P"homey.g"
G91                      ; relative positioning
G1 H2 Z5 F800            ; lift Z 5mm before moving
G90                      ; absolute positioning
G1 X150 Y150 F6000       ; nozzle to bed centre (probe lands at X+2 Y+42). CHECK: probe point is on the bed
G30                      ; probe the bed and set Z
G1 Z10 F600              ; lift to Z10 (guide T step 1 expects Z10 after G28 Z)
