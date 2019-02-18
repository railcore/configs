; homeall by executing individual axes homing macros

; Homing with endstops
M98 P"homing/homex.g"
M98 P"homing/homey.g"
M98 P"homing/homez.g"

; Homing with no endstops (sensorless homing)
; Comment out the Endstop homing lines above and uncomment these lines to use sensorless homing
;M98 P"homing/homex-sensorless.g"
;M98 P"homing/homey-sensorless.g"
;M98 P"homing/homez.g"