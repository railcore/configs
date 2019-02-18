; https://duet3d.dozuki.com/Wiki/Using_mesh_bed_compensation "Checking the trigger height"
M561 ; Cancel any existing bed compensation 
M208 S1 Z-3 ; to temporarily allow Z moves down to Z=-3mm
M564 S0 ; to allow movement lower than where the firmware thinks Z=0 
