(ns robot-simulator)

(def deltas {:east {:x 1 :y 0} :north {:x 0 :y 1} :west {:x -1 :y 0}  :south {:x 0 :y -1}})

(def turn-map {:east  {:left :north, :right :south},
             :north {:left :west, :right :east},
             :west  {:left :south, :right :north},
             :south {:left :east, :right :west}})

(defn robot[initial-coord initial-bearing]
    {:coordinates initial-coord :bearing initial-bearing})

(defn turn[robot orientation] 
        (assoc robot, :bearing ((turn-map (robot :bearing)) orientation)))

(defn advance[robot]
        (let [delta (deltas (:bearing robot))]
            {:coordinates (merge-with + delta (:coordinates robot)) :bearing (:bearing robot)} ))

(defn follow-letter[robot lt] 
      (condp = lt
        \A (advance robot) 
        \L (turn robot :left)
        \R (turn robot :right)))

(defn simulate[instructions robot]
       (reduce  follow-letter robot instructions)
)