(ns rotational-cipher)

(defn rotate-by [key ch]
  (let [ic (int ch) rc (+ ic key)]
    (cond 
      (and (<= (int \a) ic) (<= ic (int \z))) 
        (char (if (> rc (int \z)) (+ (- rc (int \z)) (dec (int \a))) rc))
      (and (<= (int \A) ic) (<= ic (int \Z))) 
        (char (if (> rc (int \Z)) (+ (- rc (int \Z)) (dec (int \A))) rc))
      :default ch
    ))
  )

(defn rotate [input key]
  (->> input  
      (map (partial rotate-by key))
      (map str)
      (clojure.string/join)
    )
)
