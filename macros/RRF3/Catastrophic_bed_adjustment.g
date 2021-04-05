;File     : Catastropic bed recovery (30mm)
;Effect   : Increases probe height and leadscrew adjustment maximum before homing and leveling (then returns values to standard config.g values)
;Use-case : When the bed needs major readjustment, and you know the current angle of the bed is compatible with your hotend/fan/probe setup. Allows an offset of 30mm 
;           compared to the standard 7.5mm.

M561                     ; Clear bed transforms
M671 S30                 ; Change maximum leadscrew adjustment to 30mm - S is the max correction in mm
M558 H30                 ; Change dive height to 30mm

G91 
G1 Z30 H2                ; As this script is for large bed levels, we raise Z to same as M558 for a safe probe.
G90 


G28 XY                   ; Home XY
G0 X150 Y115             ; Move PROBE to the center of the bed (change this depending on your probe offset)
G30                      ; Probe Z

;nano probe
G30 P0 X145 Y145 Z-99999
G30 P1 X145 Y155 Z-99999
G30 P2 X155 Y150 Z-99999 S3 

M671 S15                 ; Change maximum leadscrew adjustment to 15mm - S is the max correction in mm
M558 H15                 ; Change dive height to 15mm

;micro probe
G30 P0 X120 Y120 Z-99999
G30 P1 X120 Y180 Z-99999
G30 P2 X180 Y150 Z-99999 S3 

M671 S7.5                 ; Change maximum leadscrew adjustment to 7.5mm , this is the normal distance
M558 H7.5                 ; Change dive height to 7.5mm,  , this is the normal distance

;mini probe
G30 P0 X100 Y100 Z-99999
G30 P1 X100 Y200 Z-99999
G30 P2 X200 Y150 Z-99999 S3 

G32                       ; normal bed level

M999                      ; reboot to reset all M671 and M558 values to whatever user has as default.