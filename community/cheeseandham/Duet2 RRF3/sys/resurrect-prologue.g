; The Duet can be configured to detect a power failure and store the current state once the power returns if a user wants to resume the print
; resurrect-prologue.g is run that would contain user commands to home the printer etc before resuming.


;At the very least, your sys/resurrect-prologue.g file must do the following:
;
;    Home the printer, without crashing the head into the print. On a delta, or on a Cartesian or CoreXY printer with a Z max homing switch, you can home all axes. On other types of
; printers you may have to skip homing Z and use a G92 command to tell the printer the current Z coordinate. If you choose not to home an axis, then even if the print head hasn't moved
; since power down, the motor positions will change by up to 4 full steps compared to their position at power down. Note: recent firmware versions write a G92 command containing the 
; coordinates at the time of failure into resurrect.g, just before the call to resurrect-prologue.g. So you may get away without homing axes. But it is still best to home any axes that you 
; can (typically X and Y on a cartesian or CoreXY printer).
;    Execute M116 to wait for all heaters to reach operating temperature. You may do this either before or after homing axes.
;    If your power fail procedure in the M911 command retracts filament and your printer has a single nozzle, you may wish to undo the retraction.


M116 ; wait for temperatures
G28 X Y ; home X and Y, hope that Z hasn't moved
M83 ; relative extrusion
G1 E4 F3600 ; undo the retraction that was done in the M911 power fail script