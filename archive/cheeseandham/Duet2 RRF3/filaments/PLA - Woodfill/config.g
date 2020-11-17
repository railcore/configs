;PLA config.g
G10 S170 R60 ; Heat up the current tool to 190C enough for PLA
M140 S70 R30
M207 S0.6 F3600 Z0.18        ; Firmware Retraction 0.6mm , speed 60m/s , Z-hop 0.18
M572 D0 S0.07                ; Pressure advance compensation (if needed to be changed)