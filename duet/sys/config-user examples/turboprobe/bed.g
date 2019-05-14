M561                         ; clear any existing bed transform
;don't forget to move according to your probe offset. mine is Y35 so I deduct that from my G1 moves.
G30 P0 X10 Y30 Z-99999
G30 P1 X10 Y275 Z-99999
G30 P2 X270 Y150 Z-99999 S3
