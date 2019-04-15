;File     : homez.g
;Effect   : does a 2-stage Z-homing. Once quickly to bring the bed up from a long distance quickly, then again slower for better accuracy.
;Use-case : the machine may be Z-homed from any position at a reasonable pace, without resorting to dangerous options such as M564 H0 - while still retaining accuracy of the final probe.

G91 G1 Z5 F800 S2 ; lift z so we don't crash
G90 G1 X150 Y150 F6000 ; Move to the center of the bed

; M558  Fxxx sets the probing speed.
; Probe rapidly to get us in the right ballpark.
; This brings the bed up quickly but may be less accurate.
; Initially set to 150 for commissioning, 500 is being used when printer is fully commissioned.
M558 F150
G30

; Probe again slowly for precision
M558 F50
G30
