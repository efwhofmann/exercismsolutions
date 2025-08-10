(ns accumulate)

(defn accumulate [mp coll] ;; <- arglist goes here
     (if (seq coll)
       (cons (mp (first coll)) (accumulate mp (rest  coll)))
       [])
)
