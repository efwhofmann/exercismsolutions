(ns leap)

(defn leap-year? [year] ;; <- argslist goes here
  ;; your code goes here
  (or (zero? (rem year 400)) (and (zero? (rem year 4)) (not (zero? (rem year 100))) ))
)
