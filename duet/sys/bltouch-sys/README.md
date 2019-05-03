# Bl Touch Bed probing

## Deploying and retracting the probe
*** WARNING - Always test probe deploy/retract before homing Z
*** WARNING - If polarity in deployprobe.g and retractprobe.g are wrong, you WILL have a head crash	
*** WARNING - **Always** make sure your cables are correct, secure and test them thoroughly before homing Z for the first times!

If you have a BLtouch (a z probe that must be deployed before probing and retracted afterwards) use deployprobe.g and retractprobe.g to call the appropriate deploy and retract commands. These are called by M401 - Deploy z probe, M402 - Retract z probe.

Note: If you do not have a Z probe that needs to deploy or retract then you must not have these files in the /sys/ directory