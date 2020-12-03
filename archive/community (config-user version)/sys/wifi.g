; Wifi Networking
M552 S0    ; Disable Wifi
G4 P1000   ; Wait a second
M587 S"NetworkNameHere" P"PasswordHere" ; Set SSID and Password for WiFi
M587
M552 S1                                 ; Enable WiFi
G4 P5000   ; Wait 5 seconds
M552 
