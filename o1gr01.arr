# A Hanoi tower implementation in Pyret
# Define all elements
red-ring-50 = circle(50, "solid", "red")
blue-ring-40 = circle(40, "solid", "blue")
green-ring-30 = circle(30, "solid", "green")
orange-ring-20 = circle(20, "solid", "orange")
black-hole-5 = circle(5, "solid", "black")

# Move elements around
# the board dimensions are (500, 140)
# pins are at (70, 70), (250, 70) and (430, 70)
red-blue = overlay(blue-ring-40, red-ring-50)
red-blue-green = overlay(green-ring-30, red-blue)
red-blue-green-orange = overlay(orange-ring-20, red-blue-green)
red-blue-green-orange

hanoi-canvas-0 = empty-scene(500, 140)
put-image(black-hole-5, 430, 70,
put-image(black-hole-5, 250, 70,
put-image(black-hole-5, 70, 70,
put-image(red-blue-green-orange, 70, 70, hanoi-canvas-0))))

put-image(black-hole-5, 430, 70,
put-image(black-hole-5, 250, 70,
put-image(black-hole-5, 70, 70,
put-image(orange-ring-20, 250, 70,
put-image(red-blue-green, 70, 70, hanoi-canvas-0)))))

put-image(black-hole-5, 430, 70,
put-image(black-hole-5, 250, 70,
put-image(black-hole-5, 70, 70,
put-image(orange-ring-20, 250, 70,
put-image(green-ring-30, 430, 70,
put-image(red-blue, 70, 70, hanoi-canvas-0))))))

# osv.