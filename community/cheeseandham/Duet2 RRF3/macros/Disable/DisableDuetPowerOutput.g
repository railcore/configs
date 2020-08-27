M106 S0                 ; cooling fan off
M18                     ; Disable all motors.
T-1	                ; Deselect all tools

M400                    ; wait for moves to complete
M140 S0 R0              ; clear temperatures from DWC
M140 S-273.1 R0         ; Standby and initial Temp for bed as "off" (-273 = "off")
G10 P0 S-273.1 R-273.1  ; Set tool 0 operating and standby temperatures(-273 = "off")


