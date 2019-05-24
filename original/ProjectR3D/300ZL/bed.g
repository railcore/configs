M561                         ; clear any existing bed transform
G1 Z5 S2
G30 P0 X15 Y45 Z-99999
G30 P1 X15 Y275 Z-99999
G30 P2 X275 Y150 Z-99999 S3
G1 X0 Y0 F5000               ; move the head to the corner (optional)


;old points
;G30 P0 X30 Y45 Z-99999       ; define 4 points in a clockwise direction around the bed, starting near (0,0)
;G30 P1 X30 Y215 Z-99999
;G30 P2 X225 Y215 Z-99999
;G30 P3 X225 Y45 Z-99999
;G30 P4 X125 Y125 Z-99999 S0  ; finally probe bed centre, and calculate compensation
