(ns darts)

(defn score
  "Calculates the score of a dart throw"
  [x y]
  ;; function body
  (let [d (+ (* x x) (* y y))]        
      (cond
        (<= d 1) 10
        (<= d 25) 5
        (<= d 100) 1
        :else 0)
    )
  )
