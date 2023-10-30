triangle-set-1-number-1 = triangle(400, "outline", "black")

making-smaller-one = scale(0.5, triangle-set-1-number-1)

triangel-set-2-central = rotate(180, making-smaller-one)

side-length = 200

triangel-set-2 = triangle(side-length, "solid", "blue")

overlay-align("pinhole", "pinhole", triangel-set-2-central, triangle-set-1-number-1)

after-step-1 = overlay-align("left", "bottom", triangel-set-2, triangle-set-1-number-1)
after-step-2 = overlay-align("right", "bottom", triangel-set-2, after-step-1)
after-step-3 = overlay-align("center", "top", triangel-set-2, after-step-2)
after-step-3

triangle-set-3 = triangle(side-length / 2, "solid", "white")
triangle-set-3-rotated = rotate(180, triangle-set-3) 

height-1 = num-sqrt(num-sqr(side-length) - num-sqr(side-length / 2))
height-1

height-2 = num-sqrt(num-sqr(side-length / 2) - num-sqr(side-length / 4))
height-2
underlay-xy(after-step-3, 50, (2 * 173.20508075688772) - 86.60254037844386, triangle-set-3-rotated)

after-step-4 = overlay-xy(triangle-set-3-rotated, -1 * (side-length / 4), -260, after-step-3)
after-step-5 = overlay-xy(triangle-set-3-rotated, -250, -260, after-step-4)
after-step-6 = overlay-xy(triangle-set-3-rotated, -150, -86.5, after-step-5)

triangle-set-4 = triangle(50, "solid", "white")
triangle-set-4-rotated = rotate(180, triangle-set-4) 
overlay-xy(triangle-set-4-rotated, -25, -302, after-step-6)

#height of a like-sided triangle
#2ˆ2 = 1ˆ2 + xˆ2 
#xˆ2 = 2ˆ2 - 1ˆ2 = 3

num-sqrt(num-sqr(5) - num-sqr(5 / 2))