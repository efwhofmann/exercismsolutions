(ns resistor-color-trio)

(def color-map {"black" 0, "brown" 1, "red" 2, "orange" 3, 
                "yellow" 4, "green" 5, "blue" 6, "violet" 7,
                "grey" 8, "white" 9})
(def names-map {:one "ohms", :kilo "kiloohms", :meg "megaohms", :gig "gigaohms"})
(def scales-map {:one 1, :kilo 1000, :meg 1000000, :gig 1000000000})

(defn get-scale [ohms]
  (cond 
      (>= ohms (get scales-map :gig)) :gig
      (>= ohms (get scales-map :meg)) :meg
      (>= ohms (get scales-map :kilo)) :kilo
      :else :one
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
  
