M831 ; slow speeds and currents
while true
  if iterations = 5
    abort
  G1 X{move.axes[0].min+100} Y{move.axes[1].min+100} F99999
  G1 X{move.axes[0].min+100} Y{move.axes[1].max-100} F99999
  G1 X{move.axes[0].max-100} Y{move.axes[1].max-100} F99999
  G1 X{move.axes[0].max-100} Y{move.axes[1].min+100} F99999
  echo "iterations ",iterations

M830 ; reset heights,speeds and currents
while true
  if iterations = 5
  G1 X{move.axes[0].min} Y{move.axes[1].min} F99999
  G1 X{move.axes[0].min} Y{move.axes[1].max} F99999
  G1 X{move.axes[0].max} Y{move.axes[1].max} F99999
  G1 X{move.axes[0].max} Y{move.axes[1].min} F99999
  echo "iterations ",iterations
