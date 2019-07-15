; From FB post by Tony Akens - https://www.facebook.com/groups/RailCore/permalink/2373193706299708/?comment_id=2373229199629492&comment_tracking=%7B%22tn%22%3A%22R%22%7D
; Remember to retune your hotend. Default is for an E3D V6

; Mosquito Magnum Hotend
M307 H1 A472.6 C147.8 D2.7 S1.00 V24.1 B0
M563 P0 S"Mosquito Magnum"   ; Change name of hotend.

; Slice Thermistor
M305 P1 T500000 B4723 C1.196220e-7

; Maximum H1 temperature ; change this to whatever maximum you would like.
M143 H1 S300
