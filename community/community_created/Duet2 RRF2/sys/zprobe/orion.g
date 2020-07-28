; Probing configuration for Precision Piezo Orion Z-Probe

;*** WARNING: This section has not been tested throughly yet, and is based off community input. Use at your own risk.
;*** NOTE: M558 H3 and R0.5 values have been working for a year on Xepherys' self-sourced RCII300ZL. This requires fine-tuning
;***       of the Orion itself.  The default values of H5 and R0.75 are "safer" options if your tuning varies.
;*** NOTE: G31 Z-value of Z0 is excellent for hard surfaces (glass, Garolite, et cetera). Softer surfaces like BuildTak
;***       may see better results with Z-0.10

M558 P8 I1 H5 R0.75 Z1 T6000 A5 S0.005 ; Set Z probe type to switch and the dive height + speeds
G31 P500 X0 Y0 Z-0.10 ; Set Z probe trigger value, offset and trigger height
