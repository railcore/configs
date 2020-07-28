; Probing configuration for BL-touch Z-Probe

;*** WARNING - Always test probe deploy/retract before homing Z
;*** WARNING - If polarity in deployprobe.g and retractprobe.g are wrong, you WILL have a head crash

M307 H3 A-1 C-1 D-1      ; remaps some channels to make the PWM port on the duex5 work for a z-probe
                         ; if you use a different pwm port than the docs show, you have to change that
M558 P9 X0 Y0 Z1 H5 T6000 A5 S0.02  ; P9 = probe type 9 - means it'll call the deploy & retract scripts when you trigger it to probe
                                    ; X0/Y0 = not used for x or y.  Z1 = used for Z
                                    ; H5 = the height to probe from
                                    ; T6000 = travel speed.
									; A5 S0.02 is optional.  says up to 5 times, until two in a row are within 0.02 of each other
									;
									

G31 X2 Y42 Z2.65 P25 ; Customize your offsets appropriately.
                     ; definition of where the probe is X2 Y42 is offset from the nozzle  
					 ; Z2.65 is the trigger height (how high your nozzle is from the bed when the probe triggers,).  
					 ; you should dial those in.
					 ; P25 is the value at which the probe triggers. you don't need to change that