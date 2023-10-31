include world

fun draw-circle(w):
  stage-1 = put-image(circle(50, "solid", "red"),60 + w, 70, empty-scene(200, 200))
  # write a string representing the world's state on the circle
  put-image(text(to-repr(w), 24, "olive"),60 + w, 70, stage-1)
end
# cannot do specific testing on elements of the Image type


fun move-circle-right-by-2(w, ke):
  doc: ```moves circle by 2 units to the right when pressed 'r', 
       moves back to the initial position when any key is pressed
       or the circle reaches the right border of the scene (w=80)```
  if (ke == "r") and (w < 80):
    w + 2
  else:
    0
  end
where:
  move-circle-right-by-2(10, "r") is 12
  move-circle-right-by-2(80, "r") is 0
  move-circle-right-by-2(10, "q") is 0
end
  
# 0 is the representation of the initial state of the world
# the handlers to-draw and on-key make changes to the world's state
big-bang(0, [list:
    to-draw(draw-circle),
    on-key(move-circle-right-by-2)
])