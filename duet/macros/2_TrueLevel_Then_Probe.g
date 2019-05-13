;File     : TrueLevel Then Probe.g
;Effect   : Homes, performs 3 bed-levelling routines and homes again.
;Use-case : Time-saving macro, in order to get the bed as level as possible and then measured to check rail alignment.

G28 X Y
M561     ; Clear bed transforms
G28 Z    ; Home Z
G32      ; Level Bed 1
G28 Z    ; Home Z
G32      ; Level Bed 2
G28 Z    ; Home Z
G32      ; Level Bed 3
G28 Z    ; Home Z
G29      ; Probe the bed at X points