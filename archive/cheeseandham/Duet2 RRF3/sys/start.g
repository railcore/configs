;G29 S1                                               ; (temp fix) enable mesh compensation while bed is not completely level
;M376 H{20*move.compensation.meshDeviation.deviation} ; 

T0
M703
;G832                                                 ; home and probe bed, only if needed otherwise it skips.
M116                                                  ; wait for temperatures to reach their targets