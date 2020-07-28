# RRF3 Configuration file for RailcoreII ZL Series Printers ######
### cheeseandham 2020/02/12

## root
 * README.md - this file
 * bed.g - Performs bed-tramming routine
 * cancel.g - run when a print is cancelled with an M1 command during a print job.
 * config.g -  RRF3 Configuration file for RailcoreII ZL Series Printers
 * daemon.g - a daemon file that runs around once a second. Useful for temperature towers, PA and much more.
 * G832.g - run G832 for a RRF truelevel.
 * homeall.g - homeall - G28
 * homex.g - home X - G28 X
 * homey.g - home Y - G28 Y
 * homez.g - home Z - G28 Z
 * iap4e.bin - firmware update loader file
 * pause.g - called when a print from SD card is paused using M25 or M226
 * rehome.g - (future) tuned stall detection and you want to re-home and continue the print automatically.
 * resume.g - called before a print from SD card is resumed
 * resurrect-prologue.g - run to home the printer etc before resuming after power failure
 * runonce.g.keepcopy - rename to runonce.g and use for initial configuration of wifi
 * sleep.g - if M1 is issued the firmware finishes any moves left in its buffer, then shuts down, the macro file sleep.g is run before all heaters and drives are turned off.
 * start.g - run before any print is started from the SD-card. heats and probes if necessary. enables mesh comp.
 * stop.g - run when a print finishes normally with an M0 command at the end of the print job.
 * tfree0.g - free tool 0 macro
 * tfree1.g - free tool 1 macro
 * tpost0.g - after selecting tool 0 macro
 * tpost1.g - after selecting tool 1 macro
 * tpre0.g - before selecting tool 0 macro
 * tpre1.g - before selecting tool 1 macro

# Macros

## Diagnostics

 * Motion_Test_RRF3.g - performs the commissioning motion test.

### Tune

Macros for tuning

## Disable





## move: MOVE BED TO CERTAIN LOCATIONS
 * back_left.g - (future) RRF3 will base this on your axis limits
 * backoff_x.g - backoff X a set amount
 * backoff_y.g - backoff Y a set amount
 * back_right.g - (future) RRF3 will base this on your axis limits
 * bed_down.g - (future) RRF3 will base this on your axis limits
 * bed_up.g - (future) RRF3 will base this on your axis limits
 * centre.g - (future) RRF3 will base this on your axis limits
 * front_left.g - (future) RRF3 will base this on your axis limits
 * front_right.g - (future) RRF3 will base this on your axis limits
 * park.g          - park action
 * z_probe_point.g - probe Z (at current location)

## probe: VARIOUS PROBE ACTIONS & FUNCTIONS
 * bed-3point.g - probe 3 points bed level
 * bed-4point.g - probe 4 points bed level
 * height_set_large.g - set all probing heights to large (30mm), good for major bed levelling requirements
 * height_set_small.g - set all probing heights to small, good for faster probing
 * height_set_standard.g - set all probing heights to standard 7.5mm, safe area.
 * homexyz.g - just the homeall move without moving the bedup and down
 * README.md
 * truelevel_no_conditions.g - optimised truelevel RRF2
 * truelevel_fast_rrf3.g- optimised truelevel RRF3 , checks if homed and levelled and skips if it is
 * truelevel_simple_rrf2.g - optimised "dumb" truelevel RRF2 - homes and does 3 bed passes
 * truelevel_simple_rrf3.g - optimised truelevel RRF3 - homes and does 3 bed passes
 * x.g - probe X axis
 * y.g - probe y axis
 * z_accurate.g - probe Z slowly
 * z_rough.g - probe bed fast

## speed:
 * xy_fast.g - set all XY travel speeds to fast
 * xy_slow.g - set all XY travel speeds to slow
 * z_fast.g - set all Z travel speeds to fast
 * z_slow.g - set all Z travel speeds to slow
