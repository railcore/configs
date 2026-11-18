; ProbePoint.g - measure the probe trigger height (guide T "Adjusting your configuration", steps 1-2)
; Before running: home and level (G28, G32 x3), G28 Z, send G92 Z12, then jog the
; nozzle down until it just grips a sheet of paper. Remove the paper and run this.
; The Z value reported (G30 S-1) is your G31 Z trigger height for config.g.
G92 Z0                   ; the nozzle is touching the bed: call this Z0
G90                      ; absolute positioning
G1 Z5 F600               ; lift 5mm
G30 S-1                  ; probe and report the trigger height without changing Z
