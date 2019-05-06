; home X - Sensorless

M400                    	; make sure everything has stopped before we make changes
M913 X30 Y30             	; reduce motor current to 30% to prevent belts slipping
M201 X1000 Y1000                ; reduce acceleration on X/Y to stop false triggers
M915 P0:1 S3 R0 F0              ; both motors because corexy; Sensitivity 4, don’t take action, don’t filter

G91                   	 	; use relative positioning
G1 S1 X-270 F4000    		; move to home position
G1 X25 F2000          		; back off to edge of bed

G90            			; back to absolute positioning
M400
M913 X100 Y100        		; motor currents back to normal
M201 X3000 Y3000                ; accel back to original
