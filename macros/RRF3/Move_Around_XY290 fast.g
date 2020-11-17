while true
  if iterations = 5
    abort
  G1 X{move.axes[0].min+100} Y{move.axes[1].min+100} F6000
  G1 X{move.axes[0].min+100} Y{move.axes[1].max-100} F6000
  G1 X{move.axes[0].max-100} Y{move.axes[1].max-100} F6000
  G1 X{move.axes[0].max-100} Y{move.axes[1].min+100} F6000
  echo "iterations ",iterations


while true
  if iterations = 5
  G1 X{move.axes[0].min} Y{move.axes[1].min} F4000
  G1 X{move.axes[0].min} Y{move.axes[1].max} F4000
  G1 X{move.axes[0].max} Y{move.axes[1].max} F4000
  G1 X{move.axes[0].max} Y{move.axes[1].min} F4000
  echo "iterations ",iterations


while true
  if iterations = 5
  G1 X{move.axes[0].min} Y{move.axes[1].min} F24000
  G1 X{move.axes[0].min} Y{move.axes[1].max} F24000
  G1 X{move.axes[0].max} Y{move.axes[1].max} F24000
  G1 X{move.axes[0].max} Y{move.axes[1].min} F24000
  echo "iterations ",iterations
