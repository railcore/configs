; Configuration file for My Printer
; Communication and general
M111 S0                             	; Debug off
M550 PRailCore					; Machine name and Netbios name (can be anything you like)
;M551 Pmyrap                        	; Machine password (used for FTP)
;*** If you have more than one Duet on your network, they must all have different MAC addresses, so change the last digits
M540 P0xBE:0xEF:0xDE:0xAD:0xFE:0xEE 	; MAC Address
;*** Wifi Networking
M552 S1								; Enable WiFi
M555 P2                           	; Set output to look like Marlin
M575 P1 B57600 S1					; Comms parameters for PanelDue

G21                                 	; Work in millimetres
G90                                		; Send absolute coordinates...
M83                                 	; ...but relative extruder moves

; Axis and motor configuration
M669 K1								; _RRF3_ change M667 to M669 ; set CoreXY mode

M584 X0 Y1 Z5:6:7 E3:4:8:9 		; Map Z to drivers 5, 6, 7. Define unused drivers 3,4,8 and 9 as extruders
M569 P0 S0                          ; Drive 0 goes forwards (change to S0 to reverse it) X stepper (Rear)
M569 P1 S1                          ; Drive 1 goes backwards	Y Stepper (Front)
M569 P2 S1                          ; Drive 2 goes forwards		Unused
M569 P3 S0                          ; Drive 3 goes forwards		Extruder 
M569 P4 S1                          ; Drive 4 goes forwards		Extruder (unused)
M569 P5 S0							; Drive 5 goes backwards	Front Left Z
M569 P6 S0							; Drive 6 goes backwards	Rear Left Z
M569 P7 S0							; Drive 7 goes backwards	Right Z

;Leadscrew locations
M671 X-10:-10:333  Y22.5:277.5:150 S7.5  ;Front left, Rear Left, Right  S7.5 is the max correction - measure your own offsets, to the bolt for the yoke of each leadscrew

M350 X16 Y16 Z16 E16 I1	    ; set 16x microstepping for axes& extruder, with interpolation
;_RRF3_ comment out: M574 X1 Y1 Z0 S1
M574 X1 S1 P"xstop"			; _RRF3_ set X endstop to xstop port active high
M574 Y1 S1 P"ystop"			; _RRF3_ set Y endstop to ystop port active high
M906 X1400 Y1400 Z1000 E800 I60	    ; Set motor currents (mA)
M201 X3000 Y3000 Z100 E1500          ; Accelerations (mm/s^2)
M203 X24000 Y24000 Z900 E3600      ; Maximum speeds (mm/min)
M566 X1000 Y1000 Z100 E1500            ; Maximum jerk speeds mm/minute
M208 X290 Y290 Z280                 ; set axis maxima and high homing switch positions (adjust to suit your machine)
M208 X0 Y0 Z-0.5 S1                 ; set axis minima and low homing switch positions (adjust to make X=0 and Y=0 the edges of the bed)
M92 X200 Y200 Z1600 E837	    ; steps/mm

; Thermistors
;_RRF3_ comment out: M305 P0 T100000 B3950 R4700 H0 L0	; Put your own H and/or L values here to set the bed thermistor ADC correction
M308 S0 P"bedtemp" Y"thermistor" A"bed_heat" T100000 B3950 R4700 H0 L0 		;_RRF3_ Bed thermistor, connected to bedtemp on Duet2

;If you have a Slice Engineering thermistor, comment out the next line
;_RRF3_ comment out: M305 P1 T100000 B4725 R4700 H0 L0 C7.06e-8	; Put your own H and/or L values here to set the first nozzle thermistor ADC correction
M308 S1 P"e0temp" Y"thermistor" A"e0_heat" T100000 B4725 R4700 C7.06e-8 H0 L0	;_RRF3_ duet3 e3d

;If you have a Slice Engineering thermistor, uncomment the next lines.  KITS DO NOT SHIP WITH A SLICE THERMISTOR - ONLY UNCOMMENT IF YOU ORDERED ONE
;M308 S1 P"e0temp" Y"thermistor" A"e0_heat" T500000 B4723 R4700 C1.196220e-7	;_RRF3_ slice thermistor

M950 H0 C"bedheat" T0				;_RRF3_ define Bed heater is on bedheat
M950 H1 C"e0heat" T1				;_RRF3_ define Hotend heater is on e0heat

M307 H0 A240.3 C608.7 D8.2 S1.00 V24.1 B0 ; Bed Heaters
M307 H1 A270.7 C90.4 D6.7 B0 S1.0	;Heater 1 model
M570 S360				; Hot end may be a little slow to heat up so allow it 180 seconds
M143 S285

; Fans
M950 F0 C"fan0"						;_RRF3_ define fan0
M950 F1 C"fan1"						;_RRF3_ define fan1
M950 F2 C"fan2"						;_RRF3_ define fan2
M106 P0 H-1 				; disable thermostatic mode for fan 0
M106 P1 H-1 				; disable thermostatic mode for fan 1
M106 P2 H-1
M106 P0 S0 				; turn off fans
M106 P1 S0
M106 P2 S0
	
; Tool definitions
M563 P0 D0 H1                       	; Define tool 0
G10 P0 S0 R0                        	; Set tool 0 operating and standby temperatures
;*** If you have a single-nozzle build, comment the next 2 lines
;M563 P1 D1 H2                      	; Define tool 1
;G10 P1 S0 R0 X0 Y17                    	; Set tool 1 operating and standby temperatures

; Z probe and compensation definition
;*** If you have a switch instead of an IR probe, change P1 to P4 in the following M558 command
; IR PRobe - uncomment the following 2 lines if you have a and IR Probe, and comment out the BLTouch section below
;RRF3 IR Probe only comment out: M558 P1 X0 Y0 Z1			; Z probe is an IR probe and is not used for homing any axes
;M558 P1 C"^zprobe.in" H5 F120 T6000 A5 S0.02  ; _RRF3_ IR Probe connected to Z probe IN pin
;G31 X0 Y30 Z2.00 P500			; Set the zprobe height and threshold (put your own values here) 

;BLTouch - comment out the following 3 lines if using a IR Probe
;_RRF3_ comment out: M307 H3 A-1 C-1 D-1
;_RRF3_ comment out: M558 P9 X0 Y0 Z1 H5 F50 T6000 A5 S0.02  
M558 P9 C"^zprobe.in" H5 R1 F50 T6000 A5 S0.02  ; _RRF3_ BLTouch connected to Z probe IN pin
M950 S0 C"duex.pwm1"				   ; _RRF3_ Define BLTouch Servo (S0) on duet pwm1
G31 X2 Y42 Z2.65 P25 ; Customize your offsets appropriately - do a paper test, and put the probed value in the Z value here


T0					; select first hot end