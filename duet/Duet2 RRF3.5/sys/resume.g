; resume.g - run when a paused print resumes
G1 R1 X0 Y0 Z2 F6000     ; go to 2mm above the point where the print was paused
G1 R1 X0 Y0 Z0 F600      ; lower to the resume point
M83                      ; relative extruder moves
G1 E2 F2500              ; undo the pause retraction
