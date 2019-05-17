## Support files for macro "0_Fast_Truelevel_with_Mesh.g"

;Effect   : Homes, performs 3 bed-levelling routines and probes the bed for information (mesh comp. disabled afterwards)
;Use-case : Time-saving macro, in order to get the bed as level as possible and then measured to check rail alignment.

To use "0_Fast_Truelevel_with_Mesh.g" you must:-

1. Create a "bed-nodrop.g" in your sys directory. Just copy your bed.g file contents, remove any G1 Z moves (to save time raising Z up more and probing down.)
1. Alter the H height on the "3) Home Z" line to at least 1mm more than your typical probe height.
1. (Optional) Create an optimised home X and Y script (homexy-nodrop.g) in one file in sys.(examples are in "\sys\config-user examples\fast_truelevel_with_mesh") Again, remove all Z raises or drops, to replace "G28 X Y" line at the start with the M98 calling this file.