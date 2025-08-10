(ns grains)

(def two-pow
  (memoize (fn [n]
    (if (== n 0) (bigint 1)
     (* 2 (two-pow  (dec n))))))
  )

(defn square [n] 
  (two-pow (dec n))
)

(defn total [] 
  (dec (two-pow 64))
)
