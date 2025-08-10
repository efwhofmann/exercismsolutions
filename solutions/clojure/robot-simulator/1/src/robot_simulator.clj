(ns robot-simulator)

(def deltas {:east {:x 1 :y 0} :north {:x 0 :y 1} :west {:x -1 :y 0}  :south {:x 0 :y -1}})

(defn robot[initial-coord initial-bearing]
    {:coordinates initial-coord :bearing initial-bearing}
)

(defn turn-left[bearing] 
         (condp = bearing 
            :east  :north
            :north  :west
            :west  :south
            :south :east
        )
)

(defn turn-right[bearing] 
        (condp = bearing 
            :east :south
            :north :east
            :west :north
            :south :west
        )
 )

(defn advance[robot]
        (let [delta (deltas (:bearing robot))]
            {:coordinates (merge-with + delta (:coordinates robot)) :bearing (:bearing robot)}       
        )
 )

(defn follow-letter[robot lt] 
      (condp = lt
        \A (advance robot) 
        \L {:coordinates (:coordinates robot) :bearing (turn-left (:bearing robot))  }
        \R {:coordinates (:coordinates robot) :bearing (turn-right (:bearing robot))  }
       )
)

(defn simulate[instructions robot]
       (reduce  follow-letter robot instructions)
)