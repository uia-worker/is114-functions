include shared-gdrive(
  "dcic-2021",
  "1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")

shuttle = table: month, riders
  row: "Jan", 1123
  row: "Feb", 1045
  row: "Mar", 1087
  row: "Apr", 999
end


fun is-winter(r :: Row) -> Boolean:
  doc: "er den gitt måneden vintermåned"
  month = r["month"] 
  string-equal(month, "Jan") or 
  string-equal(month, "Feb")
where:
  is-winter(shuttle.row-n(0)) is true
  is-winter(shuttle.row-n(3)) is true
end

winter = filter-with(shuttle, is-winter)
order-by(winter, "riders", true)