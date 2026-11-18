# RailCore II 300ZL / 300ZLT: Duet 2 + DueX5, RRF 3.5 / 3.6

**WARNING: The RailCore is a DIY project. Build safe, build smart and BE RESPONSIBLE.
USE THESE CONFIG FILES AT YOUR OWN RISK.**

## Firmware

- Targets **RepRapFirmware 3.5.x and 3.6.x** (written against 3.6.4, the newest Duet 2 release).
- **RRF 3.6.x is the last firmware for Duet 2.** RRF 3.7 dropped Duet 2 support, so do not
  try to install 3.7 on a Duet 2.
- Will not work on RRF 3.4 or older (it uses `M570 R`, added in 3.5).
- Upgrade from older 3.x by uploading `Duet2and3Firmware-3.6.4.zip` (unextracted) in
  Duet Web Control > System. Duet3D's upgrade path is RRF 2.05.1 -> 3.0 -> 3.3 ->
  latest, so a kit still on 2.x or 3.0-3.2 must step through those first; see the
  [Duet3D update guide](https://docs.duet3d.com/en/User_manual/RepRapFirmware/Updating_firmware).

## Hardware assumed (kit, per the RailCore II build guides)

| Part | Kit item | Where it plugs in |
|---|---|---|
| Main board | Duet 2 WiFi or Ethernet + DueX5 (ribbon cable) | |
| X / rear stepper | NEMA17 stepper | Duet X (drive 0) |
| Y / front stepper | NEMA17 stepper | Duet Y (drive 1) |
| Extruder | Bondtech BMG + pancake stepper | Duet E0 (drive 3) |
| Z steppers | front left, rear left, right | DueX E2/E3/E4 (drives 5/6/7) |
| Hot end | E3D V6, stock E3D thermistor | E0 HEAT, E0 TEMP |
| Bed | Keenovo AC silicone pad via SSR, thermistor in the bed channel | Duet BED output -> SSR, BEDTEMP |
| Probe | BLTouch, offset X2 Y42 | Z_PROBE IN + DueX PWM1 |
| Endstops | X rear left, Y on the carriage (both low end) | XSTOP, YSTOP |
| Fans | hot end fan always on, layer fan | always-on header, FAN0 |

If your printer differs (Euclid or other probe, a different hot end or extruder, a DC bed),
change the matching lines and keep the `CHECK:` comments in mind.

## Install

1. Copy your current SD card `sys` folder to `sys_original` (backup).
2. Copy `sys/*` into `/sys` and `macros/*` into `/macros`.
3. Search `config.g` for **`CHECK:`** and fix every one for your machine.
4. Follow the build guide sections S "First Moves" and T "Adjusting Your Configuration":
   motor directions, `M119` endstop tests, BLTouch deploy/retract, homing, `G32`.
5. **Before the first print, tune both heaters** (macros `Tune_Hotend.g` and `Tune_Bed.g`)
   and paste the `M307` lines they print into `config.g`. The shipped `M307 H0/H1 B0 S1.00`
   lines are placeholders, not tuned values.
6. Measure the probe trigger height with `ProbePoint.g` and put it in `G31 ... Z`.

## What changed from the "Duet2 RRF3" bundle

- `M140 H0` added: since RRF 3.1 there is no default bed heater; without it the bed is not a bed.
- `M570 S360` removed: it never extended heat-up time (S was a print-cancel timeout) and RRF
  3.4.2 removed it. Fault detection is now stated explicitly at the RRF defaults.
- Bed heater PWM set to 10 Hz (`M950 ... Q10`) for the SSR, as Duet3D recommends.
- Bed temperature limit added (`M143 H0 S120`); hot end limit now names its heater (`M143 H1 S285`).
- `M307` lines are tune-me placeholders (the old A/C/D values came from another machine).
- Tool temperatures use `M568` instead of `G10 P0 S R`.
- `M584` maps only the extruder that exists; `M555` (Marlin emulation) dropped.
- Network protocols set explicitly with `M586` (HTTP on, FTP/Telnet off).
- `homez.g` ends at Z10, as the guide expects; `bed.g` and `homez.g` home X/Y first if needed.
- `cancel.g` and `stop.g` added (heaters off; cancel only moves Z if it is homed, as RRF 3.5
  runs `cancel.g` even when unhomed).
- Mesh grid moved into `config.g` (`M557`); the old `gridProbe` macro left the printer in
  relative mode.

## License

MIT, like the rest of this repository.
