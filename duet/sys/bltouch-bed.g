;File     : bltouch-bed.g
;Effect   : 4 point bed homing for the Bl-touch and magnetic bed, probing between magnets.
;Use-case : The BL-touch is affected by magnets. This 4 point bed.g was created by Robert Hendricks to probe points in the nulls in the magnetic field.
;         : remove/rename the original bed.g and rename this file to 'bed.g' to activate.

M561 ; clear any existing bed transform 3/18/2019
G30 P0 X50.5 Y45.9 Z-99999 ; define 4 points in a clockwise direction around the bed, starting near (0,0)
G30 P1 X50.5 Y255.9 Z-99999
G30 P2 X293.9 Y255.9 Z-99999
G30 P3 X293.9 Y45.9 Z-99999 S3
G1 X0 Y0 F5000
