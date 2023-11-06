# første element er venstre pinne 
#
#       #1       #2       #3
#       o        o        o
#
# initiell tilstand: 4 ringer på pinne 1 
# fra den største nederst til den minst øverst
# g     -
# o    ---
# y   -----
# b  -------
#       o        o        o
#
#
hanoi-board = [list: 
  [list: 
    circle(20, "solid", "green"), 
    circle(30, "solid", "orange"), 
    circle(40, "solid", "yellow"), 
    circle(50, "solid", "blue")], 
  [list: ], 
  [list: ]]

# gjør ett trekk fra #1 til #3
# og får et følgende bord
#
hanoi-board-1-3 = [list: 
  [list:  
    circle(30, "solid", "orange"), 
    circle(40, "solid", "yellow"), 
    circle(50, "solid", "blue")], 
  [list: ], 
  [list: circle(20, "solid", "green")]]

# sjekker hva er første elementet i bordlisten
check:
  hanoi-board.get(0) is [list: 
    circle(20, "solid", "green"), 
    circle(30, "solid", "orange"), 
    circle(40, "solid", "yellow"), 
    circle(50, "solid", "blue")]
end

# desinger funksjon for å kunne gjøre alle lovlige trekk
# i første omgang laget vi denne funksjonen med 2 parametre
# tallet på posisjon til pinnen (#1, #2 eller #3)
# etterpå la vi til en parameter for å representere
# tilstand, slik at det er mulig å gjennomføre spill
# ved mellomlagre minst en tilstand til bordet
#
fun move(fra, til, state):
  # sjekker om ikke pinnne man ønsker å flytte ringen 
  # fra er ikke tom (empty)
  if (state.get(fra - 1) == empty):
      raise("illegael move")
  else:
    first = state.get(fra - 1).first # grønn
    rest = state.get(fra - 1).rest # resten av stabelen uten grønn
    phase-1 = state.set(fra - 1, rest)
    phase-1.set(til - 1, link(first, phase-1.get(til - 1)))
  end
end

# Nå er det mulig å spille spillet med kommandoer 
# trekk-1 = move(1, 2, initiell-tilstand)
# trekk-2 = move(1, 3, trekk-1)
# trekk-3 = move(2, 3, trekk-2)
# ... osv.
# hvis man ønsker å angre er det bare å trekke en tilstand tilbake
# trekk-4 = trekk-2
# hvis man ønsker å starte på nytt
# trekk-1 = initiell-tilstand
#
hanoi-board-new-state-1 = move(1, 2, hanoi-board)
hanoi-board-new-state-2 = move(2, 3, hanoi-board-new-state-1)
hanoi-board-new-state-2

# for å tranformere listene med sirkler til sammensatte tegninger
# kan man bruke innebygde funksjonen fold 
# funksjonen fold kan brukes sammen med en tegnefunksjon, som 
# overlay, for eksempel, og fungerer på følgende måte, -
# første legges alt i stabel i minne
# |                       |
# |-----------------------|
# | overlay(green, orange)|
# |-----------------------|
# | overlay(fun2, yellow) |
# |-----------------------|
# | overlay(fun1, blue)   |
# |-----------------------|
# siden den ytterste funksjonen kan ikke returnerer før de andre, indre, 
# funksjonene har returnert, legges de "i mente"
# funksjonene returnerer fra toppen av
#
# |                       |
# |-----------------------|
# |                       | -> acc = green over orange
# |-----------------------|
# | overlay(fun2, yellow) |
# |-----------------------|
# | overlay(fun1, blue)   |
# |-----------------------|
# 
# |                       |
# |-----------------------|
# |                       | 
# |-----------------------|
# | overlay(fun2, yellow) | -> acc = acc over yellow
# |-----------------------|
# | overlay(fun1, blue)   |
# |-----------------------|
# 
# 
# |                       |
# |-----------------------|
# |                       | 
# |-----------------------|
# | overlay(fun2, yellow) | 
# |-----------------------|
# | overlay(fun1, blue)   | -> acc over blue 
# |-----------------------|
# 
# hvor den siste er ((green over orange) over yellow) over blue
overlay(overlay(overlay(hanoi-board.get(0).get(0), hanoi-board.get(0).get(1)), hanoi-board.get(0).get(2)), hanoi-board.get(0).get(3))

# for å designe noe bedre kode til oppgave
# som kan også ta hele listen som paramter
# skriver vi en separt funksjon draw-overlay,
# dvs. den metoden som vi ønsker å påkalle
# to elementer av gangen fra listen, så lenge
# det er elementer i listen
#
fun draw-overlay(acc, elt) -> Image: 
  overlay(acc, elt)
end

# til slutt bruker vi den innebygde funksjonen fold
# denne kunne vi lagt inn i egen funksjon draw-board(hele-bordet)
# eller lignende 
#
fold(draw-overlay, circle(5, "solid", "black"), hanoi-board.get(0))

# hvis vi ønsker å lage en funksjon for å tegne hele bordet 
# må vi iterere (gå over) alle elementene i hovedlisten, dvs
# alle tre pinnene og plassere de (med put-image, f.eks.) på 
# bordet (som kan være en empty-scene, f.eks.)