;File     : TrueLevel.g
;Effect   : Homes, and performs bed-levelling routines conditionally.
;Use-case : Time-saving macro, in order to get the bed as level as possible and homed.


; ### Temporary changes
M557 X50:250 Y50:250 P5    ; Dense mesh
G832
G29
G1 X295 Y295 Z30