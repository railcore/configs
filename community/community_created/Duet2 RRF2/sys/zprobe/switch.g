; Probing configuration for switch Z-Probe

;*** Do not use the Fxxx parameter for M558 here, it is set in homez.g
M558 P4 X0 Y0 Z1                        ; Z probe is an IR probe and is not used for homing any axes
G31 X0 Y30 Z2.00 P500                   ; Set the zprobe height and threshold (put your own values here)
                                        ; Tip: A larger trigger height in G31 moves you CLOSER to the bed