krs-bre = 58.144976
krs-len = 7.988925

osl-bre = 59.903738
osl-len = 10.758328

# radianer = grader * (PI / 180)
# 1 radian = (180 / PI)
# 1 grad er lik (PI / 180) 
rad-bre = (osl-bre - krs-bre) * (PI / 180)
rad-bre
rad-len = (osl-len - krs-len) * (PI / 180)
rad-len

a-utr = num-expt(num-sin(rad-bre / 2), 2) + (num-cos(krs-bre * (PI / 180)) * num-cos(osl-bre * (PI / 180)) * num-expt(num-sin(rad-len / 2), 2))
a-utr

c-utr = 2 * num-atan2(num-sqrt(a-utr), num-sqrt(1 - a-utr))
c-utr

# Antar at radius av Jorden er 6367 km (er en approksimasjon)
km = 6367 * c-utr
km
mi = 3956 * c-utr
mi

# Ca. 5% feilmargin
km * 0.05

line(km, 0.5, "red")
krs-osl-line = add-line(empty-scene(400, 150), 0, 0, 250, 0, "orange")
krs-osl-line-text-krs = put-image(text("KRS", 24, "olive"), 40, 75, krs-osl-line)
put-image(text("OSL", 24, "olive"), 360, 75, krs-osl-line-text-krs)