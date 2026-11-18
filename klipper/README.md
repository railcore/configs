# Klipper configs for RailCore printers

**Starting points, not drop-in files.** Every value marked `# CHECK:` must be verified on your
machine before you trust it. Run the motion test, `QUERY_ENDSTOPS`, a probe test and
`PID_CALIBRATE` before your first print.

| folder | printer | board |
|---|---|---|
| [`300ZL-Duet2-Duex5`](300ZL-Duet2-Duex5/printer.cfg) | RailCore II 300ZL / 300ZLT kit | Duet 2 WiFi or Ethernet + Duex 5 |
| [`Mini-Duet3-Mini5plus`](Mini-Duet3-Mini5plus/printer.cfg) | RailCore Mini kit | Duet 3 Mini 5+ + Expansion Mini 2+ |

[`macros.cfg`](macros.cfg) is shared: `G32` (home + `Z_TILT_ADJUST`), `PRINT_START`, `PRINT_END` and
`PROBE_LEADSCREWS`.

## Install

1. Install Klipper, Moonraker and a web UI (Mainsail or Fluidd) on the host computer, for
   example with [KIAUH](https://github.com/dw-0/kiauh).
2. Back up your RepRapFirmware config (see railcore.org, Software → Backup).
3. Build and flash Klipper for the board (instructions at the top of each `printer.cfg`).
4. Copy `printer.cfg` from your printer's folder and `macros.cfg` into the host's config folder
   (usually `~/printer_data/config/`).
5. Set the `[mcu] serial:` line (`ls /dev/serial/by-id/*`), then work through every `CHECK:`.

Full walk-through: [railcore.org/klipper](https://railcore.org/klipper/).

The pin numbers come from Klipper's `generic-duet2-duex.cfg` and `generic-duet3-mini.cfg`. The
machine values (steps, leadscrew positions, probe offsets, endstop sides) come from the kit RRF
configs in this repo and in [railcore/railcore-mini](https://github.com/railcore/railcore-mini).

Older community Klipper configs live in [`archive/Klipper`](../archive/Klipper).

## License

MIT, like the rest of this repository (see [LICENSE](../LICENSE)).
