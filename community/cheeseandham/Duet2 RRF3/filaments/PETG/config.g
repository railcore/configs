G10 S255 R160                ; Heat up the current tool to 260C enough for PETG first layer
M140 S85 R40
M207 S0.6 F3600 Z0.18        ; Firmware Retraction 0.6mm , speed 60m/s , Z-hop 0.18
M572 D0 S0.07                ; Pressure advance compensation (if needed to be changed)
M290 R0 S0.05
