T0   ; select T0
M703                     ; load current filament config
M144                     ; put bed into standby mode
M400                     ; wait for moves to complete
T-1                      ; unselect tool to put it into standby temperature.
