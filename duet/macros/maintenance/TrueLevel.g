;File     : DisableAllMotors.g
;Effect   : Switches off extruders 1 and 2.
;Use-case : Time-saving macro. Performs 3 bed-levelling routines and homes in order to get the bed as level as possible.

M561     ; Clear bed transforms
G28 Z    ; Home Z
G32      ; Level Bed 1
G32      ; Level Bed 2
G32      ; Level Bed 3
G28 Z    ; Home Z