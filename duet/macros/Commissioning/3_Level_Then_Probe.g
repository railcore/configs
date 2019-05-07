;File     : Level Then Probe.g
;Effect   : Homes, performs 3 bed-levelling routines and homes again.
;Use-case : Time-saving macro, in order to do a quick bed level and then measure to check rail alignment.
G28 X Y
M561     ; Clear bed transforms
G28 Z    ; Home Z
G32      ; Level Bed 1
;G28 Z   ; Home Z
G29      ; Probe the bed 
