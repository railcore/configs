; pause.g
; called when a print from SD card is paused using M25 or M226
;
M83           ; relative extruder moves
G1 E-6 F3600  ; retract 6mm of filament

G91
G1 Z5 F900    ; lower z
G90
T-1           ; deselect all tools and run any tool change macro file (this enables fan to be switched on and off)


