(ns resistor-color)

(def color-map {"black" 0, "brown" 1, "red" 2, "orange" 3, 
                "yellow" 4, "green" 5, "blue" 6, "violet" 7,
                "grey" 8, "white" 9})

(def colors
 (vec (keys (into (sorted-map-by 
             (fn [k1 k2] (compare (get color-map k1)
               (get color-map k2)))) color-map))))

(defn color-code
  "Returns the numerical value associated with the given color"
  [color]
  (get color-map color))
