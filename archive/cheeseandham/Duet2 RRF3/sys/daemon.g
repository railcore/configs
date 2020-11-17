; PA tuner
;M572 D0 S{move.axes[2].machinePosition*0.005}

; temperature tower
;M104 S{260-(floor((move.axes[2].machinePosition-1.6)/10)*5)}



