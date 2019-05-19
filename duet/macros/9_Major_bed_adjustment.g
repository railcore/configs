;File     : Major_bed_adjustment.g
;Effect   : Increases probe height and leadscrew adjustment maximum to 30mm before homing and leveling (then returns values to standard config.g values)
;Use-case : When the bed needs major readjustment, and you know the current angle of the bed is compatible with your hotend/fan/probe setup. Allows an offset of 30mm 
;           compared to the standard 7.5mm.

M561                     ; Clear bed transforms
M671 S30                 ; Custom M671 setting for leadscrew adjustment - S is the max correction in mm
M558 H30                 ; Change probe height to 30mm

G91 G1 Z30 F800 S2       ; Lift z extra before starting
G28                      ; Home XYZ
G32                      ; Level Bed with 30mm dive height

;Put things back to sensible defaults - match your config-user.g if possible
M671 S7.5                ; Back to standard M671 config.g setting for leadscrew adjustment - S is the max correction in mm
M558 H7.5                ; Match your stand M558 config.g setting or above (normally 10mm) 
M561                     ; Clear bed transforms - stop mesh compensation being used during normal operation
G1 X150 Y150 F6000       ; Move to centre
