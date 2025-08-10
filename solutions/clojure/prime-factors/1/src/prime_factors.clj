(ns prime-factors)



(defn of [N] ;; <- arglist goes here
      ;; your code goes here
  (loop [num N next 2 pdivs []]
    (if (== num 1) pdivs 
      (if (zero? (mod num next))
        (recur (/ num next) next (conj pdivs next))
        (recur num (inc next) pdivs)
        ))
    )
 )
