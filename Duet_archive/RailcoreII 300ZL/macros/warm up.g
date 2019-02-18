M291 P"Please wait while the printer is calibrated and pre-heated." R"Start-up" S0 T3   ; Display message
M140 S57 R30            ; set bed temperature
G10 P0 R50 S190        ; Set tool 0 operating and standby temperatures
T-1                      ; deselect tool 0
G28
G32
