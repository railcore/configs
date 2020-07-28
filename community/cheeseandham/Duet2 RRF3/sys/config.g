; #######################################################################
; ###### RRF3 Configuration file for RailcoreII ZL Series Printers ######
; #######################################################################
; cheeseandham 2020/07/27
; Duet G-code:               https://duet3d.dozuki.com/Wiki/Gcode
; RRF3 G-code meta commands: https://duet3d.dozuki.com/Wiki/GCode_Meta_Commands
; RRF3 Object model:         https://duet3d.dozuki.com/Wiki/Object_Model_of_RepRapFirmware
; RRF3 Pin Names:            https://duet3d.dozuki.com/Wiki/RepRapFirmware_3_overview#Section_Pin_names_for_Duet_2_WiFi_Ethernet

; #### Debugging
M111 S0                     ; Debug off
M929 P"eventlog.txt" S1     ; Start logging to file eventlog.txt
M550 P"RailCore"            ; Machine name and Netbios name (can be anything you like)

;M540 P2c:3a:e8:0b:09:f7    ; Set MAC address (unused on DuetWifi)
M552 S1                     ; Enable networking
M552 P0.0.0.0               ; Use DHCP

; #### General preferences
M555 P0                     ; Set output to look like RepRap_Firmware
;M575 P1 B57600 S1          ; Comms parameters for PanelDue (not installed)
G21                         ; Work in millimetres
G90                         ; Send absolute coordinates...
M83                         ; ...but relative extruder moves

; #### Networking and Communications
M552 S1                     ; Enable WiFi
M586 P1 S1                  ; Enable FTP
;M551 P"myrap"              ; Machine password (used for FTP), leave disabled for anonymous login on a local network.
M586 P2 S1                  ; Enable Telnet

; #### Axis and motor configuration
M669 K1                     ; CoreXY mode
M350 X16 Y16 Z16 E16 I1     ; Set 16x microstepping for axes & extruder, with interpolation.
M92 X200 Y200               ; Set 200 steps/mm for XY (0.9 deg/step . 16 tooth pulley and GT2 belt)

; #### Drives
M584 X0 Y1 Z5:6:7 E3:4:8:9  ; Map Z to drivers 5, 6, 7. Define unused drivers 3,4,8 and 9 as extruders
M569 P0 S0                  ; Drive 0 goes forwards (change to S0 to reverse it)| X stepper
M569 P1 S1                  ; Drive 1 goes backwards(change to S1 to reverse it)| Y Stepper
M569 P2 S1                  ; Drive 2 goes forwards                             | Unused
M569 P3 S1                  ; Drive 3 goes forwards                             | Extruder S1 for Bondtech, S0 for Titan
M569 P4 S1                  ; Drive 4 goes forwards                             | Extruder (unused)
M569 P5 S0                  ; Drive 5 goes backwards                            | Front Left Z
M569 P6 S0                  ; Drive 6 goes backwards                            | Rear Left Z
M569 P7 S0                  ; Drive 7 goes backwards                            | Right Z

; #### Leadscrew locations
;Front left,(-10,22.5) Rear Left (-10.,227.5) , Right (333,160) S10 is the max correction - measure your own offsets, to the bolt for the yoke of each leadscrew
M671 X-10:-10:333  Y22.5:277.5:150 S7.5  

; #### Endstop Configuration - sensorless
;M574 X1 S3                                ; _RRF3_ set X endstop to xstop port sensorless
;M574 Y1 S3                                ; _RRF3_ set Y endstop to ystop port sensorless
;M915 P0:1 S3 R0 F0                        ; Both motors because corexy; Sensitivity 3, don’t take action, don’t filter

; #### Endstop Configuration - microswitches
M574 X2 S1 P"xstop"                      ; _RRF3_ set X endstop to xstop port (switch/active high)
M574 Y1 S1 P"ystop"                      ; _RRF3_ set Y endstop to ystop port (switch/active high)

; #### Current, speeds and Z/E step settings
; ##########################################
; Conservative speeds for commissioning
;M906 X1150 Y1150 Z600 E560 I60   ; Motor currents (mA) - WARNING: Conservative - May trigger stallguard (and prematurely during homing) if sensorless.
;M201 X1000 Y1000 Z30 E500        ; Accelerations (mm/s^2) - WARNING: Conservative
;M203 X3000 Y3000 Z50 E1800       ; Maximum speeds (mm/min) - WARNING: Conservative
;M566 X700 Y700 Z30 E500          ; Maximum jerk speeds mm/minute - WARNING: Conservative

; Fully commissioned speeds.
M906 X1400 Y1400 Z1000 E560 I25   ; Set motor currents (mA) and idle at 25%
M201 X2500 Y2500 Z100 E1500       ; Accelerations (mm/s^2)
M203 X18000 Y18000 Z900 E3600     ; Maximum speeds (mm/min)
M566 X500 Y500 Z100 E1500         ; Maximum jerk speeds mm/minute

M92 Z800                          ; Leadscrew motor axis steps/mm for Z - TR8*4 / 1.8 deg stepper or TR8*8 / 0.9 deg stepper
M92 E415                          ; Extruder steps/mm - 1.8 deg/step Steps/mm (Standard BMG pancake stepper 17HS10-0704S)
M204 T3000                        ; Set travel acceleration
M558 T18000 F150                  ; Set Z probe Travel speed

; Kit settings - uncomment for kit
;M92 Z1600                        ; Steps/mm for Z - TR8*2 / 1.8 deg stepper or TR8*4 / 0.9 deg stepper
;M92 E837                         ; Extruder - 0.9 deg/step (ProjectR3D kit with E3D stepper MT-1701HSM140AE or Standard Titan stepper 42BYGHM208P4.5-15-X2)




; ####  Set axis minima:maxima switch positions
; Adjust to suit your machine and to make X=0 and Y=0 the edges of the bed
;M208 X0:250 Y0:250 Z-0.2:230      ; Conservative 300ZL/T settings (or 250ZL) ; These values are conservative to start with, adjust during commissioning.
M208 X-32:305 Y0:300 Z0:610        ; 300ZLT

; #### Tool definitions
; #####################
; #### Tool E0 / Heater 1 - E3D Gold
M950 F0 C"fan2" Q500                                                              ; Set Fan 0 on "Duet2 PWM Fan 2" for Part Cooling fan
M950 F1 C"duex.fan6" Q500                                                         ; Set Fan 1 on "Duex5 fan port 6" for Hotend Fan 0

M950 H1 C"e0heat" T1                                                              ; Heater 1 is Hotend heater is on e0heat
M308 S1 P"e0temp" Y"thermistor" A"e0_heat" T100000 B4725 R4700 C7.06e-8 H0 L0     ; E0 thermistor,
M563 P0 S"E3Dv6 Gold" D0 H1 F0                                                    ; Define tool 0 uses extruder 0, heater 1 ,Fan 1

M106 P0 S0 H-1 C"Part"                                                            ; (Part cooling fan) Set fan 0 value, Thermostatic control is OFF
M106 P1 S1 H1 T45 C"Hotend"                                                       ; Set fan 1. Thermostatic control is ON for Heater 1 (Hotend fan)

G10 P0 X0 Y0 Z0 S-273.1 R-273.1                                                   ; Set tool 0 axis offsets and operating and standby temperatures
M143 H1 S290                                                                      ; Maximum Extruder 0 temperature (E3D requires 285C to change nozzle)
M570 H1 P5 T15                                                                    ; Configure heater fault detection
                                                                                  ; Hnnn Heater number
                                                                                  ; Pnnn Time in seconds for which a temperature anomaly must persist
                                                                                  ; on this heater before raising a heater fault.
                                                                                  ; Tnnn Permitted temperature excursion from the setpoint for this heater (default 15C);

; #### Filament options
; #####################
; M200 D1.75                                  ; Set filament diameter for future volumetric extrusion.
; Volumetric extrusion is an option you can set in some slicers whereby all extrusion amounts are specified in mm3 (cubic millimetres) of filament instead of mm of filament. 
; This makes the gcode independent of the filament diameter, potentially allowing the same gcode to run on different printers.

; #### Filament runout for E0
; M591 D0 P1 C3 S1                          ; Enable Sunhokey filament sensor runout (disabled)
; Configure filament sensing
; D0 - Extruder 0
; P - Sensor type - 1=simple sensor (high signal when filament present)
; C - Which input the filament sensor is connected to. On Duet electronics: 3=E0 endstop input
; S - 1 = enable filament monitoring when printing from SD card.


; #### Z probe
; ############
; #### Z probe and compensation definition

; *** If you have a switch instead of an IR probe, change P1 to P4 in the following M558 command
; IR Probe - uncomment the following 2 lines if you have a and IR Probe, and comment out the BLTouch section below
; #####################
M558 P1 C"^zprobe.in"
G31 X0 Y35 P500                             ; Probe offset and "stop" value.
M558 F750                                   ; Z probe - raise probe height.
                                            ; H10 - dive height
                                            ; A bigger dive height prevents a situation where the bed is out of alignment by more than the dive
                                            ; height on any corner, which can crash the hot-end into the bed while moving the head in XY.
                                            ; Probing speed and travel speed are similarly reduced in case the Z probe is not connected properly
                                            ; (or disconnects later after moving to a point) giving the user more time to stop.

; BLTouch - comment out the following 3 lines if using a IR Probe
; #####################
;_RRF3_ comment out: M307 H3 A-1 C-1 D-1
;_RRF3_ comment out: M558 P9 X0 Y0 Z1 H5 F50 T6000 A5 S0.02  
;M558 P9 C"^zprobe.in" R1 F50          ; _RRF3_ BLTouch connected to Z probe IN pin
;M950 S0 C"duex.pwm1"				   ; _RRF3_ Define BLTouch Servo (S0) on duet pwm1
;G31 X2 Y42 Z2.65 P25 ; Customize your offsets appropriately - do a paper test, and put the probed value in the Z value here

; #### General probing configuration and offsets
G31 Z0.70                                   ; Probe Z height - determine your own Z-Offset and enter it here (Note: Positive number is closer to the bed)
M558 H5 A5 T12000 S0.02                     ; M558 settings for all probes


; ##### Mesh
;M557 X50:200 Y50:200 S150 S150             ; Set Default Mesh (conservative)
M557 X35:280 Y35:280 P2                     ; Set Mesh for probe


; #### Bed - Heater 0
M950 H0 C"bedheat" T0                                                           ;_RRF3_ define Bed heater is on bedheat **

M308 S0 P"exp.thermistor6" Y"thermistor" A"bed_heat" T100000 B3950 R4700 H0 L0  ;_RRF3_ Bed thermistor, connected to bedtemp on Duet2
M308 S8 P"exp.thermistor7" Y"thermistor" A"keenovo" T100000 B3950 R4700  H0 L0  ; Silicone heater thermistor on x7
M570 S360                       ; Print will be terminated if a heater fault is not reset within 360 minutes.
M140 H0                         ;  (H0 as per 3.0 RC11 ** before M143 )
M143 H0 S120                                                                    ; Maximum bed temperature, if using a magbed this is important!



; #### Chamber - Heater 3 - (not enabled yet)
;M141 H3
;M950 H3 C"exp.heater3" T3                                                          ; heater 3 is the chamber heater
M308 S3 P"exp.thermistor3" Y"thermistor" A"chamber high" T100000 B3950 R4700  H0 L0 ; Set Sensor 3 as 100K thermistor with B=3950 and a 4.7K series resistor
M308 S4 P"exp.thermistor4" Y"thermistor" A"chamber low" T100000 B3950 R4700  H0 L0  ; Set Sensor 4 as 100K thermistor with B=3950 and a 4.7K series resistor
;M301 H3 B1                                                                         ; use bang-bang control for the chamber heater
;M106 P3 S1 H1 T50:80 C"Chamber"

; #### Electronics Cabinet
M950 F7 C"duex.fan7"             ; Fan 7 on "Duex5 fan port 7"
M950 F8 C"duex.fan8"             ; Fan 8 on "Duex5 fan port 8"

M308 S10 Y"mcu-temp" A"mcu-temp" ; Set MCU on Sensor 10
M106 P7 T35:55 H10 C"Elec.Cab.1" ; Electronics cooling fan that starts to turn on when the MCU temperature (virtual heater 100) reaches 45C
M106 P8 T35:55 H10 C"Elec.Cab.2" ; and reaches full speed when the MCU temperature reaches 55C or if any TMC2660 drivers
                                 ; (N.B. If a fan is configured to trigger on a virtual heater whose sensor represents TMC2660 driver over-temperature
                                 ; flags, then when the fan turns on it will delay the reporting of an over-temperature warning for the corresponding drivers
                                 ; for a few seconds, to give the fan time to cool the driver down.)

; #### Compensation
;M556 S80 X0.8 Y0.3 Z0.72                 ; Axis compensation (measured with Orthangonal Axis Compensation piece)
M579 X1.0027 Y1.0027 Z1.0011              ; Scale Cartesian axes
M572 D0 S0.05                             ; Default Pressure Advance compensation

; #### Default heater model (Overridden by config-override.g, but here in case config-override.g fails)
;M307 H0 A270.7 C90.4 D6.7 B0 S1.0          ; 700W Bed Heater settings.
M307 H0 A186.9 C972.5 D5.3 S1.00 V24.2 B0   ; 300W Bed Heater settings.
M307 H1 A508.1 C249.0 D3.8 S1.00 V24.2 B0   ; E3D Gold hotend settings.

M501                              ; Load saved parameters from non-volatile memory

; #### FINISH STARTUP.
; Purposely engage motors to prevent bed from moving after power on.
G91 
G1 Z-0.001 S2
G90

; Ensure all temperatures are off and cleared.
M140 S0 R0               ; clear temperatures from DWC
M140 S-273.1 R0 	     ; Standby and initial Temp for bed as "off" (-273 = "off")
G10 P0 S-273.1 R-273.1   ; Set tool 0 operating and standby temperatures(-273 = "off")


;#### Custom area
; #### Fans
;M950 F2 C"nil"                     ; Disable FAN 2


; #### Lights
M950 F3 C"!exp.heater3"          ; Fan 3 on Duex5 expansion heater 3 for White LEDs
M950 F4 C"!exp.heater4"          ; Fan 4 on Duex5 expansion heater 3 for Red LEDs
M950 F5 C"!exp.heater5"          ; Fan 5 on Duex5 expansion heater 3 for Green LEDs
M950 F6 C"!exp.heater6"          ; Fan 6 on Duex5 expansion heater 3 for Blue LEDs
M106 P3 S0 C"White"              ; Set Fan3 as White LED and switch off.
M106 P4 S1 C"Red"                ; Set Fan3 as Red   LED and switch ON.
M106 P5 S0 C"Green"              ; Set Fan3 as Green LED and switch off.
M106 P6 S0 C"Blue"               ; Set Fan3 as Blue  LED and switch off.


; #### Flicker all lights to test.
M106 P4 S0                        ; Switch off red light.
M106 P3 S1                        ; Switch on white light
M106 P3 S0                        ; Switch off white light
M106 P6 S1                        ; Switch on blue light.
M106 P6 S0.20                        ; Switch off blue light. Blue light for dev
M106 P5 S1                        ; Switch on green light.


G91                               ; Send relative coordinates.
G1 Z0.001 F99999 H2               ; Engage motors to prevent bed from moving after power on.
G90                               ; Send absolute coordinates.

M106 P5 S0                        ; Switch off green light.


