;File     : TrueLevel.g
;Effect   : Homes, and performs bed-levelling routines conditionally.
;Use-case : Time-saving macro, in order to get the bed as level as possible and homed.

; #### Start script
M671 S15                   ; Custom M671 setting for leadscrew adjustment - S is the max correction in mm
M558 H15 A1                ; Set to twice your typical probe height for safety, but you can set this down
                           ; to 1mm for super-fast probing. The firmware moves the Z probe to this height
                           ; above where it expects the bed to be before commencing probing. The maximum depth of probing
                           ; from this position is twice the dive height. A small dive height will make probing faster, because the Z probe has
                           ; less distance to travel before reaching the bed

M561                       ; clear any existing bed transform

;If the bed is "perfect" assume it needs relevelling, so disable XY so it needs to home and level.
if move.calibration.initial.deviation == 0  || move.calibration.initial.mean == 0  || move.calibration.final.deviation == 0  || move.calibration.final.mean == 0
  M84

;If the printer hasn't been homed, home it
if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed 
  echo "You need to home and level, performing operation."
  G91                                                      ; Relative mode.
  G1 Z15 F900 H2                                           ; Lower Z
  ;#### Probe Y Axis
  G1 Y-350 F3000 H1                                        ; move Y towards Y0 and sense endstop
  G1 Y4 F3000                                              ; back off 
  G1 Y-6 F1000 H1                                          ; move Y towards Y0 and sense endstop
  G1 Y100 F3000 H1                                         ; move Y towards Y0 and sense endstop
  
  ;#### Probe X Axis
  G1 X-350 F3000 H1                                        ; move X towards X0 and sense endstop
  G1 X-4 F3000                                             ; back off
  G1 X6 F1000 H1                                           ; move X towards X0 and sense endstop
  
  ;#### Probe centre
  G90                                                      ; Absolute mode.
  G1 X{move.axes[0].max/2} Y{move.axes[1].max/2}-35 F99999 ; Move NOZZLE to the center of the bed
  G30                                                      ; Probe Z

  ;#### Perform a mini-3 point probe. By just probing a tiny area, the chance of damaging the bed is reduced.
  G30 P0 X130 Y130 Z-99999
  G30 P1 X130 Y170 Z-99999
  G30 P2 X175 Y150 Z-99999 S3

M671 S7.5                                                  ; Custom M671 setting for leadscrew adjustment - S is the max correction in mm
G30 P0 X70 Y70 Z-99999                                     ; Do at least one 3 Point G32 bed probe from larger probe height
G30 P1 X70 Y245 Z-99999
G30 P2 X245 Y140 Z-99999 S3
G1 X{move.axes[0].max/2} Y{move.axes[1].max/2}-35 F99999   ; Move NOZZLE to the center of the bed
G30                                                        ; Probe Z


; ### Bed should be homed now and levelled.
M671 S1                                                    ; Custom M671 setting for leadscrew adjustment - S is the max correction in mm
M558 H1 A5 F100                                            ; Set to twice your typical probe height for safety, but you can set this down to 1mm for super-fast probing.
                                                           ; Set Z probe Travel speed to slow due to proximity

while iterations < 5
  if move.calibration.initial.deviation < 0.05
    if move.calibration.final.deviation < move.calibration.initial.deviation + 0.05
      if move.calibration.final.deviation > move.calibration.initial.deviation - 0.05
        break
  echo "Repeating calibration because initial deviation (" ^ move.calibration.initial.deviation ^ "mm) must be < 0.05"
  echo "and (" ^ move.calibration.final.deviation ^ "mm) must be within 0.05 of initialDeviation"

  G30 P0 X70 Y70 Z-99999                                    ; 3 Point G32 bed probe.
  G30 P1 X70 Y245 Z-99999
  G30 P2 X245 Y140 Z-99999 S3
  G1 X{move.axes[0].max/2} Y{move.axes[1].max/2}-35 F99999  ; Move NOZZLE to the center of the bed
  G30 ; Probe Z

echo "Auto calibration successful, deviation", move.calibration.final.deviation ^ "mm"
echo "Auto calibration successful, initialDeviation", move.calibration.initial.deviation ^ "mm"
