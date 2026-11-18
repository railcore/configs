; Tune_Bed.g - autotune the bed heater (stay with the printer, nothing on the bed)
; When it finishes, copy the M307 H0 ... line it prints into config.g.
M291 P"Bed will heat to 90C for tuning. Nothing on the bed. Stay with the printer." R"Tune bed" S3
M303 H0 S90              ; tune heater 0 at 90C. CHECK: use your usual highest bed temperature
