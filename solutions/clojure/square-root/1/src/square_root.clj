(ns square-root)

(defn square-root
  "Calculates a number's square root"
  [n]
  (int (if (zero? n) 0 
    (loop [a (/ (inc n) 2)]
      (if (< (abs (- (* a a) n)) 1/1000) a
        (recur (* (+ a (/ n a)) 1/2))
      )))))
