; bed.g - three-leadscrew auto levelling, run by G32 (RailCore II 300ZL/ZLT, Duet 2, RRF 3.5/3.6)
; The leadscrew positions are set by M671 in config.g.
if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed
  G28                    ; home first if needed
M561                     ; clear any bed transform (mesh)
G90                      ; absolute positioning
G1 Z5 F800               ; safe height
G30 P0 X15 Y45 Z-99999   ; probe near the front left leadscrew
G30 P1 X15 Y275 Z-99999  ; rear left
G30 P2 X275 Y275 Z-99999 ; rear right
G30 P3 X275 Y45 Z-99999 S3 ; front right, then adjust the three Z motors
; CHECK: run G32 two or three times until the reported deviation stops shrinking.
G1 X0 Y0 F6000           ; park at the front left
