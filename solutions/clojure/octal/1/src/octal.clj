(ns octal)

(defn kth-power-of-eight [k] 
  (reduce * (repeat k 8))
  )

(defn valid? [strg] 
  (nil? (re-find #"[A-Za-z89<>%\$]" strg))
  )

(defn to-decimal [strg] ;; <- arglist goes here
  ;; your code goes here
(if (valid? strg)
  (reduce + (for [idx (range (count strg))] (* (nth (map #(- (int %) 48)(reverse strg)) idx) (kth-power-of-eight idx))))
  0) 
)
