Support files for Fast_truelevel_with_mesh

Homes, performs 3 bed-levelling routines and probes the bed for information (mesh comp. disabled afterwards) within 1.5-2 minutes
in order to get the bed as level as possible and then measured to check alignment.

Read through the script so you understand what it is doing.

 1. You must create a bed-nodrop.g in your sys directory.Copy you bed.g and remove any G1 Z moves to save going up more and probing down.
 1. Alter the H height on the "3) Home Z" line to at least 1mm more than your typical probe height.
 1. Further optimisation can be achieved with a homexy-nodrop.g in sys to remove extraneous Z rises and falls.