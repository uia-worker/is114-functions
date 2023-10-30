include world

fun draw-circle(n):
  put-image(circle(50, "solid", "red"),60 + n, 70, empty-scene(200, 200))
end


fun move-circle-right-by-2(w, ke):
  doc: ```moves circle by 2 units to the right when pressed 'r', 
       moves back to the initial position when any key is pressed```
  if ke == "r":
    w + 2
  else:
    0
  end
end
  
big-bang(0, [list:
    to-draw(draw-circle),
    on-key(move-circle-right-by-2)
])