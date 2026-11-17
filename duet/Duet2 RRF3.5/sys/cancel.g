; cancel.g - run when a paused print is cancelled
; Since RRF 3.5 this runs even when the axes are not homed, so check before moving.
M568 P0 A0               ; tool 0 heaters off
M140 S-273.1             ; bed heater off
M106 P0 S0               ; layer fan off
if move.axes[2].homed
  G91
  G1 Z10 F600            ; move the bed away from the nozzle
  G90
