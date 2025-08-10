(ns cars-assemble)

(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
  (let [cars-assembled (* 221.0 speed) ]
  (cond
      (= speed 0) 0.0
    (<= speed 4)  cars-assembled
    (<= speed 8) (* 0.9 cars-assembled)
    (= speed 9) (* 0.8 cars-assembled)
    (= speed 10) (* 0.77 cars-assembled)
    ))
  )

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (int (/ (production-rate speed) 60))
  )
