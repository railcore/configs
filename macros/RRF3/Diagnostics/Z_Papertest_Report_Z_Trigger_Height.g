;File     : report Z trigger height.g
;Effect   : Reports the current height of the probe to the bed and saves it to config-override.g
;Use-case : Use this macro to assist in configuring your Z offset for probes.

G92 Z0     ; to define that height as Z=0
G1 Z5      ; Command the nozzle up 5mm
G30 S-3    ; Probes the bed without resetting the Z=0 position and reports to the G-code console.
M564 S1 H1 ; Limit axes
M500 P31   ; Save G31 information to sys/config-override.g on the SD card