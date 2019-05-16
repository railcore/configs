; Home Y Axis

G91
G1 Y-320 F4000 S1
G1 Y4 F600
G1 Y-10 S1

G90 G1 Y120 F18000      ; move a bit for X homing (may help avoid hotend hitting Z yokes)

; Home X Axis
G1 X-320 F4000 S1
G1 X4 F600
G1 X-10 S1
G1 Z-4 F200 S2
G90

