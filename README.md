# configs

## Duet Configurations for RailCore Printers

**WARNING: The RailCore is a DIY project. Build safe, build smart and BE RESPONSIBLE.**
**When in doubt, double check things. USE COMMON SENSE AND USE THESE CONFIG FILES AT YOUR OWN RISK.**

The "duet" folder contains a Duet configuration bundle for RepRapFirmware Duet (Ethernet/Wifi) for the RailCore II 300ZL and 300ZLT.

This bundle has been created by community members with the following goals in mind:-

 1. Ease of use (where it does not conflict with other goals)
 1. Standardisation of many settings across self-sourcers and kit builds.
 1. Ease of upgrade of configuration, without disrupting the custom setting that make each users RailCore individual.
 1. Safety during build and commissioning
 
 In order to achieve this we have come up with the following approach, that is slightly different to the standard, monolithic Duet config.g file which each user then edits.
 
 1. A main "config.g" file that provides the most basic, common and conservative settings for your RailCore build. This file is not intended to be edited by users, and can be updated over time from this repository to update or enable features.
 1. A secondary "config-user.g" to provide the custom settings for each setup. Any setting not defined in this file will take it's value from config.g. Any setting that is defined, will override any basic setting in "config.g" - the user is always in control.
 1. The "config-user.g" has many sections commented out by default. These sections are intended to be individually enabled, tested and modified as commissioning progresses, in a safe and controlled manner.
 1. Test macro(s) are available in order to test your build in a useful and standardised way during commissioning, in order to help pick up any build problems.

## Usage Instructions

Create your own or use an existing "config-user.something" file to base your own on,and name it "config-user.g".
Place this file in /sys to replace the existing one, which is there as a placeholder and warning system.

Examples and standard files for kits and self-builders are available, and there are also bundles for items where extra files are required (such as the BL-touch or sensorless homing) 
Each config-user file is enabled to allow the RailCore to be operational, and initally many conservative values
will be inherited from the stock config.g
To override these and unleash your Railcores' speeds, size and/or features after building, you must during commissioing test, measure then uncomment and modify the various lines (preferably individually) to suit **your** RailCore build.

While we have done our best to comment the files, we cannot put the full documentation for every command into these configuration files.
So do be sure to read the Duet G-code documentation on any G or M code line you are unsure of.

 **The included config-user.g in the /sys directory is not intended for use, and if run will stop your RailCore with a warning.**
