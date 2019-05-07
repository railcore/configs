;File     : TrueLevel.g
;Effect   : Homes, performs 3 bed-levelling routines and homes again.
;Use-case : Time-saving macro, in order to get the bed as level as possible and homed.

G28 X Y
M561     ; Clear bed transforms
G28 Z    ; Home Z
G32      ; Level Bed 1
G32      ; Level Bed 2
G32      ; Level Bed 3
G28 Z    ; Home Z