; bed.g - three-leadscrew auto levelling, run by G32 (RailCore Mini, Duet 3 Mini 5+, RRF 3.6/3.7)
; The leadscrew positions are set by M671 in config.g.
if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed
  G28                    ; home first if needed
M561                     ; clear any bed transform (mesh)
G90                      ; absolute positioning
G1 Z7.5 F800             ; safe height
G30 P0 X10 Y75 Z-99999   ; near the left leadscrew
G30 P1 X75 Y140 Z-99999  ; rear
G30 P2 X145 Y75 Z-99999  ; right
G30 P3 X75 Y42 Z-99999   ; front
G30 P4 X75 Y75 Z-99999 S3 ; centre, then adjust the three Z motors
; CHECK: run G32 two or three times until the reported deviation stops shrinking.
G1 X0 Y0 F6000           ; park at the front left
