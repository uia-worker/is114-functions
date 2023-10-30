import lists as L
include gdrive-sheets
include data-source # to get the sanitizers
include shared-gdrive("dcic-2021", "1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")
ssid = "1RYN0i4Zx_UETVuYacgaGfnFcv4l9zd9toQTTdkQkj7g"



progoblig =
  load-table: Id, col-1a,	col-1b,	col-1c,	col-1d,	col-1e,	col-1f,	col-1g,	col-1h,	col-1i,	col-1j,	col-1k,	col-1l,	col-1m,	col-1n,	col-1o,	col-2a, col-2b,	col-2c,	col-2d,	col-2e,	col-2f,	col-2g
    source: load-spreadsheet(ssid).sheet-by-name("progoblig", true)
  end

fun eval-to-number(score :: Any) -> Number:
  doc: "if score is some(true) then 1, if score is some(false) or none, then 0"
  cases(Option) score:
    | some(a) => if a == true: 1 else: 0 end
    | none => 0
  end
where:
  eval-to-number(some(true)) is 1
  eval-to-number(some(false)) is 0
  eval-to-number(none) is 0
end

fun fix-boolean(s :: Any) -> Any:
  doc: "If s is not a boolean default to none."
  cases(Option) s:
    | some(a) => a
    | none => none
  end
where:
  fix-boolean(some(true)) is true
  fix-boolean(none) is none
end


sum-true = extend progoblig
  using col-1a,	col-1b,	col-1c,	col-1d,	col-1e,	col-1f,	col-1g,	col-1h,	col-1i,	col-1j,	col-1k,	col-1l,	col-1m,	col-1n,	col-1o,	col-2a, col-2b,	col-2c,	col-2d,	col-2e,	col-2f,	col-2g:
  final-score: eval-to-number(col-1a) + 
  eval-to-number(col-1b) +	
  eval-to-number(col-1c) +	
  eval-to-number(col-1d) +	
  eval-to-number(col-1e) +	
  eval-to-number(col-1f) +	
  eval-to-number(col-1g) +	
  eval-to-number(col-1h) +	
  eval-to-number(col-1i) +	
  eval-to-number(col-1j) +	
  eval-to-number(col-1k) +	
  eval-to-number(col-1l) +	
  eval-to-number(col-1m) +	
  eval-to-number(col-1n) +	
  eval-to-number(col-1o) +
  eval-to-number(col-2a) +
  eval-to-number(col-2b) +	
  eval-to-number(col-2c) +
  eval-to-number(col-2d) +
  eval-to-number(col-2e) +	
  eval-to-number(col-2f) +
  eval-to-number(col-2g)
end

#sum-true

col-names-all = progoblig.row-n(0).get-column-names()
col-names = L.remove(col-names-all, "Id")
#col-names
fixed-booleans = for map(elem from col-names):
  freq-bar-chart(transform-column(progoblig, elem, fix-boolean), elem)
end
fixed-booleans