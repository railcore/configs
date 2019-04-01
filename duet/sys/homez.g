; Home Z Axis

G91 G1 Z5 F800 S2 ; lift z so we don't crash
G90 G1 X150 Y150 F6000 ; Move to the center of the bed

; M558  Fxxx sets the probing speed.
; Probe rapidly to get us in the right ballpark.
; This brings the bed up quickly but may be less accurate.
M558 F500
G30

; Probe again slowly for precision
M558 F50
G30
