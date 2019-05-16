; Home Y & X START
;Change currents for sensorless homing
M400                    ; make sure everything has stopped before we make changes
M913 X40 Y40            ; reduce motor current to 40% to prevent belts slipping
M201 X300 Y300          ; reduce acceleration on X/Y to stop false triggers
; home Y - I home Y first to ensure hotend fan doesn't hit left side Z extrusions.
G1 Y-330 F4000 S1       ; move to home position

; home X
; Put currents back for moving to best location for homing X
M400                    ; make sure everything has stopped before we make changes
M913 X100 Y100          ; motor currents back to normal
M201 X3000 Y3000        ; accel back to original

G90 G1 Y120 F18000      ; back off to between the Z extrusions for X sensorless (avoids E3D fan hitting them)

;Change currents for sensorless homing
M400                    ; make sure everything has stopped before we make changes
M913 X40 Y40            ; reduce motor current to 40% to prevent belts slipping
M201 X300 Y300          ; reduce acceleration on X/Y to stop false triggers

G91 G1 S1 X-330 F4000   ; move to home position

; Put currents back 
M400                    ; make sure everything has stopped before we make changes
M913 X100 Y100          ; motor currents back to normal
M201 X3000 Y3000        ; Accel back to sensible values.

; Home Y & X END
