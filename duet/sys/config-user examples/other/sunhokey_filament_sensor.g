; #### Filament runout sensor - for use with https://www.thingiverse.com/thing:3731171
; D0 - Extruder 0
; P - Sensor type - 1=simple sensor (high signal when filament present)
; C - Which input the filament sensor is connected to. On Duet electronics: 3=E0 endstop input
; S - 1 = enable filament monitoring when printing from SD card.

M591 D0 P1 C3 S1	; Enable Sunhokey filament sensor runout
