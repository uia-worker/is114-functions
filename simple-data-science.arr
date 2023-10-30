include shared-gdrive("dcic-2021", "1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")


shuttle = table: month, riders
  row: "Jan", 1123
  row: "Feb", 1045
  row: "Mar", 1087
  row: "Apr", 999
end

# SQL-lignende (relatert til READ i CRUD)
month-only = select month from shuttle end 
check:
  month-only is table: month
    row: "Jan"
    row: "Feb"
    row: "Mar"
    row: "Apr"
  end
end 

# reservert ord "sieve" (innebygd funksjon; READ i CRUD)
# sile eller filtrere
less-than-1K = sieve shuttle using riders:
  riders < 1000
end
check:
  less-than-1K is table: month, riders
    row: "Apr", 999
  end
end

# metode (knyttet til en instans; READ i CRUD)
fun below-1K(r :: Row) -> Boolean:
  doc: "determine whether row has fewer than 1000 riders"
  r["riders"] < 1000 # r.get-column("riders")
where:
  below-1K(shuttle.row-n(2)) is false
  below-1K(shuttle.row-n(3)) is true
end

# metode (READ i CRU)
fun is-winter(r :: Row) -> Boolean:
  doc: "is the given month a winter month?"
  month = r["month"] 
  string-equal(month, "Jan") or 
  string-equal(month, "Feb")
where:
  is-winter(shuttle.row-n(0)) is true
  is-winter(shuttle.row-n(3)) is false
end

# videre analyse vha. funksjoner i Pyret
winter = filter-with(shuttle, is-winter)
# Oppgave: skriv en sjekk for winter
order-by(winter, "riders", true)

order winter: 
  riders descending
end

# sjekk om begge funksjonene kan brukes
# less-than-1K og below-1K
below-1K-test = filter-with(shuttle, below-1K)
order-by(below-1K-test, "riders", true)