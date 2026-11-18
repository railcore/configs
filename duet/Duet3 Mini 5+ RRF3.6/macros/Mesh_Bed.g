; Mesh_Bed.g - probe a height map using the M557 grid in config.g
; (replaces the old "gridProbe" macro, which left the machine in relative mode)
if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed
  G28
G29 S0                   ; probe the grid, save heightmap.csv and enable compensation
