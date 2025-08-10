(ns binary)

(defn valid? [str]
  (nil? (re-find #"[^012]" str))
  )

(def two-pow
  (memoize (fn [n]
      (if (== n 0) 1
      (* 2 (two-pow  (dec n))))))
  )



(defn to-decimal [str] ;; <- arglist goes here
  (if (valid? str)
  (reduce + (map-indexed #(if (zero? %2) 0 (two-pow %1)) (map #(- (int %) (int \0)) (reverse str)))) 
    0)
)


