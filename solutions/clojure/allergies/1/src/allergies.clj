(ns allergies)

(def allergens {0 :eggs 1 :peanuts, 2 :shellfish, 
                3 :strawberries, 4 :tomatoes, 5 :chocolate,
                6 :pollen, 7 :cats})

(defn allergies [key] ;; <- arglist goes here
  ;; your code goes here
  (let [allergies-vec '[]]
    (vec (flatten 
    (keep not-empty 
    (for [i (range 0 8)]
      (if (bit-test key i) (conj allergies-vec (allergens i)) allergies-vec)
    )))))
)

(defn allergic-to? [key the-allergen] 
  (contains? (set (allergies key)) the-allergen)
)
