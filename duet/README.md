# Configuration for Duet 2 Ethernet and Duet 2 Wifi

## Conventions

### sys

* All filenames shall be all lowercase
* Filenames of g-code files to be executed via M98 shall be hyphenated based on `<purpose>-<option>.g`.  e.g.
  * `probe-ir.g`
  * `probe-bltouch.g`
  * `probe-piezo.g`
* The first line of each gcode file shall be a comment detailing exactly what the file deals with.  e.g.

  `; Probing configuration for Precision Piezo Orion Z-Probe`

### macros

* All macro files shall be named in Pascal Case and be descriptive of the function, e.g. `GridProbe`
* The first line of each macro shall be a comment that describes the purpose of the macro

## Standard Connections

The Duet and Duex have a multitude of connection ports available.  Whenever possible, alternate hardware should be configured to use the same ports as the hardware it replaced.  For example, if you configure a new type of bed probe, try to use the same connections that other bed probes are using.

| Port      | Purpose           |
|-----------|-------------------|
| X-Stepper | Front x/y stepper |
| Y-Stepper | Rear x/y stepper  |
| E0        | Extruder Stepper  |
