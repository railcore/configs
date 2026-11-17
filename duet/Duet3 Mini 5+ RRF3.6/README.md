# RailCore Mini: Duet 3 Mini 5+ + Expansion Mini 2+, RRF 3.6 / 3.7

**WARNING: The RailCore is a DIY project. Build safe, build smart and BE RESPONSIBLE.
USE THESE CONFIG FILES AT YOUR OWN RISK.**

## Firmware

- Targets **RepRapFirmware 3.6.x and 3.7.x**, standalone mode (no SBC). Written against
  3.6.4 and checked against the 3.7.0 upgrade notes.
- Needs 3.6 or newer: the PanelDue block uses `take()`, added in RRF 3.6. On 3.5, replace
  that `if`/`else` block with a plain `M575 P1 S1 B57600`.
- Upgrade by uploading `Duet2and3Firmware-<version>.zip` (unextracted) in
  Duet Web Control > System. Going to 3.7 also needs the new `Duet3_SDiap32_Mini5plus.bin`
  (included in the zip). A PanelDue needs PanelDue firmware 3.5.1+ for RRF 3.6, and 3.7.0+
  for RRF 3.7. See the [Duet3D update guide](https://docs.duet3d.com/en/User_manual/RepRapFirmware/Updating_firmware).

## Hardware assumed (kit, per the RailCore Mini build guides and the railcore-mini repo)

| Part | Kit item | Where it plugs in |
|---|---|---|
| Main board | Duet 3 Mini 5+ WiFi + Duet 3 Expansion Mini 2+, 24V PSU | |
| X / rear stepper | stepper | Expansion drive 6 |
| Y / front stepper | stepper | Expansion drive 5 |
| Extruder | Bondtech LGX Lite | drive 0 |
| Z steppers | front right, rear right, left | drives 2 / 3 / 4 |
| Hot end | E3D Revo Micro (HeaterCore with its own thermistor) | OUT1, TEMP1 |
| Bed | 24V silicone heater (adhesive), thermistor | OUT0, TEMP0 |
| Probe | BLTouch, offset X2 Y42 | IO3 |
| Endstops | X at rear right (X max), Y (Y min) | IO2, IO4 |
| Fans | layer fan, panel fans, hot end fan (5V via buck converter for Revo Micro) | OUT4, OUT5, OUT6 |

## Install

1. Copy your current SD card `sys` folder to `sys_original` (backup).
2. Copy `sys/*` into `/sys` and `macros/*` into `/macros`.
3. Search `config.g` for **`CHECK:`** and fix every one for your machine.
4. Follow the Mini build guide sections S "First Moves" and T "Adjusting Your Configuration".
   Two guide errata to know about: guide Q step 11 swaps the X/Y driver labels compared with
   the kit config and guide S, and guide T step 6 says `M569 P3` for the extruder, which is
   `M569 P0` on the Mini.
5. **Before the first print, tune both heaters** (macros `Tune_Hotend.g` and `Tune_Bed.g`)
   and paste the `M307` lines they print into `config.g`. The shipped `M307 H0/H1 B0 S1.00`
   lines are placeholders, not tuned values.
6. Measure the probe trigger height with `ProbePoint.g` and put it in `G31 ... Z`.

## What changed from the kit config (railcore-mini `config/Duet3 Mini 5+`)

- `M667 S1` replaced by `M669 K1`. **RRF 3.5 removed M667**, so the kit config no longer sets
  CoreXY on current firmware.
- `M570 S360` removed (never extended heat-up time; removed in RRF 3.4.2). Fault detection is
  stated explicitly at the RRF defaults.
- `M307` placeholders added (the kit config had no heater model at all), bed limit `M143 H0 S110`,
  hot end limit names its heater (`M143 H1 S285`).
- `M586 P0 S1` enables HTTP explicitly: **RRF 3.7 no longer enables HTTP by default**.
- PanelDue `M575` picks P1 (3.6) or P2 (3.7) automatically: RRF 3.7 renumbered the serial channels.
- Tool temperatures use `M568`; tool and fans have names.
- `resume.g` now undoes the 2 mm pause retraction (the kit file was missing it).
- `cancel.g`, `stop.g`, mesh grid (`M557`) and the tuning/probing macros added.

## License

MIT, like the rest of this repository.
