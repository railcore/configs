# configs

## Duet Configurations for RailCore Printers

**WARNING: The RailCore is a DIY project. Build safe, build smart and BE RESPONSIBLE.**
**When in doubt, double check things. USE COMMON SENSE AND USE THESE CONFIG FILES AT YOUR OWN RISK.**

The "duet" folder contains a Duet configuration bundle for RepRapFirmware DuetEthernet or DuetWifi for the RailCore II 300ZL or 300ZLT.

This bundle has been created by community members with the following goals in mind.

 1. A main "config.g" file that provides the most basic, common and conservative settings for your RailCore build. This file is not intended to be edited by users.
 1. A secondary "config-user.g" is required which provides the custom settings for your unique setup. Examples and standard files for kits and self-builders are available, and bundles for some items where extra files are required (such as the BL-touch)
 1. The "config-user.g" has many sections commented out, these sections are intended to be individually enabled and tested as commissioning progresses.
 1. Test macro(s) in order to test your build in a useful and standardised way during commissioning.

The included config-user.g in the /sys directory is not intended for use, and if run will stop your RailCore withg a warning.

## Usage instructions

Either create your own or use an existing "config-user.something" file to base your config on,and (re)name it "config-user.g".
Place this file in /sys and replace the existing one.

There are two special example files, one for the kit and one for self-builders. 
Each config file enabled to allow the RailCore to be operational in this mode, and many conservative values
will be inherited from the stock config.g
To override these and unleash your railcores speeds, size or features, then you must test, measure, uncomment and modify the various lines (preferably individually) to suit your set-up.

While we have done our best to comment the files, we cannot put the fully documentation for every command.
So be sure to read the Duet G-code documentation on any G or M code line you are unsure of.
