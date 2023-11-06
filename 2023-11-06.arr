# først element er venstre pinne
# initiell tilstand: 4 ringer på pinne 1 ...
hanoi-board = [list: 
  [list: 
    circle(20, "solid", "green"), 
    circle(30, "solid", "orange"), 
    circle(40, "solid", "yellow"), 
    circle(50, "solid", "blue")], 
  [list: ], 
  [list: ]]
# gjør ett trekke 1 til 3
hanoi-board-1-3 = [list: 
  [list:  
    circle(30, "solid", "orange"), 
    circle(40, "solid", "yellow"), 
    circle(50, "solid", "blue")], 
  [list: ], 
  [list: circle(20, "solid", "green")]]

check:
  hanoi-board.get(0) is [list: 
    circle(20, "solid", "green"), 
    circle(30, "solid", "orange"), 
    circle(40, "solid", "yellow"), 
    circle(50, "solid", "blue")]
end
hanoi-board
hanoi-board.get(0)


fun move(fra, til, state):
  # fra er 1 og til er 3
  if (state.get(fra - 1) == empty):
      raise("illegael move")
  else:
    first = state.get(fra - 1).first # grønn
    rest = state.get(fra - 1).rest # uten grønn
    phase-1 = state.set(fra - 1, rest)
    phase-1.set(til - 1, link(first, phase-1.get(til - 1)))
  end
end

hanoi-board-new-state = move(1, 2, hanoi-board)
hanoi-board-new-state-2 = move(2, 3, hanoi-board-new-state)
hanoi-board-new-state-2

#overlay(overlay(overlay(hanoi-board.get(0).get(0), hanoi-board.get(0).get(1)), hanoi-board.get(0).get(2)), hanoi-board.get(0).get(3))

fun draw-overlay(acc, elt) -> Image: 
  overlay(acc, elt)
end

fold(draw-overlay, circle(5, "solid", "black"), hanoi-board.get(0))