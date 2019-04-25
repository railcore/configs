; Probing configuration for Precision Piezo Orion Z-Probe

;*** WARNING: This section has not been tested throughly yet, and is based off community input. Use at your own risk.
M558 P8 I1 H5 R0.75 Z1 T6000 A5 S0.005 ; Set Z probe type to switch and the dive height + speeds
G31 P500 X0 Y0 Z0 ; Set Z probe trigger value, offset and trigger height