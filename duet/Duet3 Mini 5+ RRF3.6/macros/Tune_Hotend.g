; Tune_Hotend.g - autotune the hot end heater (stay with the printer)
; When it finishes, copy the M307 H1 ... line it prints into config.g
; (replacing the placeholder), or run M500 and enable M501 in config.g.
M291 P"Hot end will heat to 250C for tuning. Keep the nozzle clear of the bed. Stay with the printer." R"Tune hot end" S3
M303 T0 S250             ; tune tool 0's heater at 250C, with layer-fan cycles
