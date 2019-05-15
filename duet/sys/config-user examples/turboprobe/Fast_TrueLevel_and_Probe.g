;File     : Fast_TrueLevel_and_Probe.g
;Effect   : Homes, performs 3 bed-levelling routines and homes again.
;Use-case : Time-saving macro, in order to get the bed as level as possible and then measured to check rail alignment.
;NOTE     : you must create a bed-nodrop.g in your sys directory.Copy you bed.g and remove any G1 Z moves to save going up more and probing down.
          ; Alter the H heigh on the 3) Home Z to at least 1mm more than your typical probe height.
          
M561                     ; Clear bed transforms
M558 T18000 F500 H7.5    ; Match H to your M561 setting (normally 7.5mm). (T)ravel 18000 (F)Probe speed 500
G28 X Y                  ; you can optimise this further by inserting code directly to home X & Y without lowering the bed in between.
G91 G1 Z7.5 F800 S2      ; lift z so we don't crash. may as well match M561 & M558 probe height 

; 1) Home Z - Large offset fast speed
G90 G1 X150 Y150 F18000 ; Move to the center of the bed fast
G30                     ; Probe single Z (at current location)

; 2) Home Z - Medium offset medium speed
M558 H3 F150            ; change dive height for second dive, Medium probe setting (speed)
G30                     ; Probe single Z (at current location)

M98 P"/sys/bed-nodrop.g" ; bed-nodrop.g is your bed.g with any G1 Z moves removed for speed.

; 3) Home Z - Small offset slow
M558 H1.2 T15000 F50    ; *** Set H to a dive height that is at least 1mm more your typical probe height ***
G90 G1 X150 Y150 F15000 ; Move to the center of the bed
G30                     ; Probe single Z

M98 P"/sys/bed-nodrop.g" ; bed-nodrop.g is your bed.g with any G1 Z moves removed for speed.

; 4) Home Z - Small offset slow
M558 T12000             ; slower speed probe travel setting
G90 G1 X150 Y150 F12000 ; Move to the center of the bed
G30                     ; Probe single Z

M98 P"/sys/bed-nodrop.g" ; bed-nodrop.g is your bed.g with any G1 Z moves removed for speed.

G29                     ; Probe the bed 

;Put things back to sensible defaults - match your config-user.g if possible
M558 H7.5 T6000         ; probe height to 7.5mm , travel 6000
M561                    ; Clear bed transforms - stop mesh compensation being used during normal operation
