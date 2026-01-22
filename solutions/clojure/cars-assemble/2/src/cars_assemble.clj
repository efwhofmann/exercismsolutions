(ns cars-assemble)

(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
  (let [cars-assembled (* 221.0 speed) ]
  (condp <= speed 
     10  (* 0.77 cars-assembled)
     9 (* 0.8 cars-assembled)
     5 (* 0.9 cars-assembled)
     1 cars-assembled
     0 0.0
  )))

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (int (/ (production-rate speed) 60))
  )
