; Function test to test each motion component in isolation, then as a system,
; at very low rates of speed.
; The user is prompted with expected behavior before each move.
; If any motion does not move as expected, either unplug the machine or hit
; cancel at the next prompt.
; Resolve any errors then run this test again from the top.

M84; disable motors to allow manual movement
M291 R"Self Test" P"Slowly move print head near the center of the bed" S3
M291 R"Self Test" P"Make sure the bed is well away from the nozzle" S3

; Test each x/y motor in isolation.  The S2 parameter makes each motor axis behave independently, not like a core-xy
M291 R"Self Test" P"Rear X/Y motor will move clockwise" S3
G91 G1 X-10 F150 S2

M291 R"Self Test" P"Rear X/Y motor will move anti-clockwise" S3
G91 G1 X10 F150 S2

M291 R"Self Test" P"Front X/Y motor will move clockwise" S3
G91 G1 Y10 F150 S2

M291 R"Self Test" P"Front X/Y motor will move anti-clockwise" S3
G91 G1 Y-10 F150 S2


; Test x/y motion in each direction
M291 R"Self Test" P"Printhead will move to the right" S3
G91 G1 X10 F150 S1

M291 R"Self Test" P"Printhead will move to the left" S3
G91 G1 X-10 F150 S1

M291 R"Self Test" P"Printhead will move toward the door" S3
G91 G1 Y-10 F150 S1

M291 R"Self Test" P"Printhead will move away from the door" S3
G91 G1 Y10 F150 S1


; Setup additional drives to move z axis independently
M584 U5 V6 W7 P6

; Test each z-tower independently
M291 R"Self Test" P"The front left z-tower will move down" S3
G91 G1 U5 F150 S2

M291 R"Self Test" P"The front left z-tower will move up" S3
G91 G1 U-5 F150 S2

M291 R"Self Test" P"The rear left z-tower will move down" S3
G91 G1 V5 F150 S2

M291 R"Self Test" P"The rear left z-tower will move up" S3
G91 G1 V-5 F150 S2

M291 R"Self Test" P"The right z-tower will move down" S3
G91 G1 W5 F150 S2

M291 R"Self Test" P"The right z-tower will move up" S3
G91 G1 W-5 F150 S2

M584 P3; Hide our additional u/v/w-axis mappings


; Test that homing works correctly
M291 R"Self Test" P"The printhead will now attempt to reach the x-axis limit switch" S3
G91 G1 X-300 F500 S1
G91 G1 X10

M291 R"Self Test" P"The printhead will now attempt to reach the y-axis limit switch" S3
G91 G1 Y-300 F500 S1
G91 G1 Y10


; Center the printhead and probe very slowly
M291 R"Self Test" P"The printhead will now move to the center of the bed and begin a slow probing cycle" S3
G90 G1 X150 Y150 F500

M558 F25
G30


M291 R"Self Test" P"Congratulations!  Testing complete.  Printer will now reset." S2
M84
M999
