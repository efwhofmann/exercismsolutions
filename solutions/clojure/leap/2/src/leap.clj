(ns leap)

(defn leap-year? [year] ;; <- argslist goes here
  ;; your code goes here
  (and (zero? (bit-and year 0x3)) (or (not (zero? (rem year 25))) (zero? (bit-and year 15)) ))
)
