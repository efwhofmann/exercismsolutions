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
  (reduce + (map (fn [b](if (>= b 5) 1 0)) birds))
  )


(defn odd-week? [birds]
 (and 
  (not (some false? (map (fn [[x y]] (= (- 1 x) y)) (partition 2 birds))))
  ;; check pattern continued to day 7 (doesn't get tested)
  (if (odd? (count birds)) (= (first birds) (last birds)) true)
  )
)
