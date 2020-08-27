;PLA config.g

G10 S210 R80                 ; Heat up the current tool to 210C enough for PLA
M140 S65 R40 	               ; Standby and initial Temp for bed as "off" (-273 = "off")
M207 S0.6 F3600 Z0.18        ; Firmware Retraction 0.6mm , speed 60m/s , Z-hop 0.18
;M572 D0 S0.07                ; Pressure advance compensation (if needed to be changed)
M572 D0 S0
M204 P1400 T4000             ; General maximum acceleration P(print) T(travel)

;M566 X1200 Y1200 Z60 E3000        ; jerk settings for PLA
;M307 H0 A214.3 C641.7 D1.3 S1.00 V24.0 B0        ; Bed PID tune for 120c
;M307 H1 A491.0 C190.9 D2.8 S1.00 V23.9 B0        ; Hot end PID tune at 280c
