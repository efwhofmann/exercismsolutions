(ns resistor-color-trio)

(def color-map {"black" 0, "brown" 1, "red" 2, "orange" 3, 
                "yellow" 4, "green" 5, "blue" 6, "violet" 7,
                "grey" 8, "white" 9})
(def names-map {0 "ohms", 1 "kiloohms", 2 "megaohms", 3 "gigaohms"})
(def scales-map {0 1, 1 1000, 2 1000000, 3 1000000000})

(defn get-scale [ohms]
  (cond 
      (>= ohms (get scales-map 3)) 3
      (>= ohms (get scales-map 2)) 2
      (>= ohms (get scales-map 1)) 1
      :else 0
    ))

(defn scaled-value [ohms scale]
    (/ ohms (get scales-map scale)))

(defn get-value [colors]
  (* (+ (* 10 (get color-map (nth colors 0))) 
              (get color-map (nth colors 1)))
     (int (Math/pow  10 (get color-map (nth colors 2))))))

(defn resistor-label
  "Returns the resistor label based on the given color bands."
  [colors]
    (let [ohms (get-value colors)
          scale (get-scale ohms)]
      (clojure.string/join " " [(str (scaled-value ohms scale)) 
                   (get names-map scale)])))
  
