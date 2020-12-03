while true
  if iterations < 6
  G1 X{move.axes[0].min+100} Y{move.axes[1].min+100} F99999
  G1 X{move.axes[0].min+100} Y{move.axes[1].max-100} F99999
  G1 X{move.axes[0].max-100} Y{move.axes[1].max-100} F99999
  G1 X{move.axes[0].max-100} Y{move.axes[1].min+100} F99999
  echo "small square iterations ",iterations

while true
  if iterations < 6
  G1 X{move.axes[0].min+10} Y{move.axes[1].min-10} F99999
  G1 X{move.axes[0].min+10} Y{move.axes[1].max-10} F99999
  G1 X{move.axes[0].max+10} Y{move.axes[1].max-10} F99999
  G1 X{move.axes[0].max+10} Y{move.axes[1].min-10} F99999
  echo "large square iterations ",iterations
