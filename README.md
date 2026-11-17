# configs

## Duet Configurations for RailCore Printers

**WARNING: The RailCore is a DIY project. Build safe, build smart and BE RESPONSIBLE.**
**When in doubt, double check things. USE COMMON SENSE AND USE THESE CONFIG FILES AT YOUR OWN RISK.**

The "duet" folder contains Duet configuration bundles for RepRapFirmware:

| Bundle | Printer | Board | Firmware |
|---|---|---|---|
| [`duet/Duet2 RRF3.5`](duet/Duet2%20RRF3.5) | RailCore II 300ZL / 300ZLT | Duet 2 WiFi/Ethernet + DueX5 | **RRF 3.5.x / 3.6.x** (current; 3.6 is the last Duet 2 firmware) |
| [`duet/Duet3 Mini 5+ RRF3.6`](duet/Duet3%20Mini%205%2B%20RRF3.6) | RailCore Mini | Duet 3 Mini 5+ + Expansion Mini 2+ | **RRF 3.6.x / 3.7.x** (current) |
| [`duet/Duet2 RRF3`](duet/Duet2%20RRF3) | RailCore II 300ZL / 300ZLT | Duet 2 + DueX5 | RRF 3.0-3.4 (legacy, kept as shipped) |
| [`duet/Duet3 300ZL Kit Config`](duet/Duet3%20300ZL%20Kit%20Config) | RailCore II 300ZL | Duet 3 6HC + SBC | RRF 3.x (legacy, kept as shipped) |
| [`duet/Duet2 RRF2`](duet/Duet2%20RRF2) | RailCore II 300ZL | Duet 2 + DueX5 | RRF 2.x (legacy) |

New builds and firmware upgrades should start from one of the two current bundles. Each has a
README with the hardware it assumes, and every value you must check on your own machine is
marked `CHECK:` in its `config.g`.

A main "config.g" file that provides the most basic, common settings for your RailCore kit build, is provided. Some useful macros are also provided.

The configs are initially maintained by Kraegar on Dropbox and can be found at:-

 * [300ZL Duet 2 RRF2 kit](https://www.dropbox.com/sh/og8bolggmqlfrsv/AAAbZ0enHyIRuYoy7knaQSbEa?dl=0)
 * [300ZL Duet 2 RRF 3 kit](https://www.dropbox.com/sh/pg0ugu5qunokjc9/AAD8PkPqVGPp-yWV5Cug3_Usa?dl=0)
 * [300ZL Duet 3 + SBC / RRF3](https://www.dropbox.com/sh/vpu1wd7kkqyabb2/AAAFGqPBm-Gtg7lRqB-g0NQMa?dl=0)

Last sync of the legacy bundles: 31 Dec 2020. The RRF 3.5/3.6 bundles were added in November 2026.

## License

The configuration files and macros in this repository are [MIT licensed](LICENSE). RailCore® designs and documentation are [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/); see [railcore/parts](https://github.com/railcore/parts) and [railcore.org](https://railcore.org).
