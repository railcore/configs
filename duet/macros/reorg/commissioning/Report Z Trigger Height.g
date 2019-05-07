;File     : report Z trigger height.g
;Effect   : Reports the current height of the probe to the bed.
;Use-case : Use this macro to assist in configuring your Z offset for probes, such as IR.

G92 Z0     ; to define that height as Z=0
G1 Z5      ; Command the nozzle up 5mm
G30 S-1    ; Probes the bed without resetting the Z=0 position and reports to the G-code console.
M291 P"Z-Probe trigger height recorded in the G-code console. Set your G31 Z parameter in config-user.g with this value." R"Z-probe trigger height" S0 T5 ; Display message