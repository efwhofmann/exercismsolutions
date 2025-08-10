(ns bird-watcher)

(def last-week 
  [0 2 5 3 7 8 4]
  )

(defn today [birds]
  (last birds)
  )

(defn inc-bird [birds]
  (assoc birds  (- (count birds) 1) (+ (last birds) 1))
  )

(defn day-without-birds? [birds]
  (or (some zero? birds) false)
)

(defn n-days-count [birds n]
  (reduce + (take n birds))
  )

(defn busy-days [birds]
  (count (filter #(>= % 5) birds))
  )

(defn alternating-pattern? [birds one two]
  (and 
   (not (some false? (map 
     (fn [[x y]] (and (= x one) (= y two))) (partition 2 birds))))
      (if (odd? (count birds)) (= (first birds) (last birds)) 
        true)))

(defn odd-week? [birds]
 (alternating-pattern? birds 1 0))

