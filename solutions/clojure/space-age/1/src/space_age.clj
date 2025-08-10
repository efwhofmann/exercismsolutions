(ns space-age)

(def orbital-periods { :mercury 0.2408467 
                       :venus 0.61519726
                       :earth 1.0
                       :mars 1.8808158
                       :jupiter 11.862615
                       :saturn 29.447498
                       :uranus 84.016846
                       :neptune 164.79132
                       }
  )

(def earth-year 31557600)

(defn convert [planet age-sec] 
 (/ age-sec (* (get orbital-periods planet) earth-year))
  )



(defn on-mercury [age] ;; <- arglist goes here
  ;; your code goes here
  (convert :mercury age)
)

(defn on-venus [age] ;; <- arglist goes here
  ;; your code goes here
  (convert :venus age)  
)

(defn on-earth [age] ;; <- arglist goes here
      ;; your code goes here
  (convert :earth age)
)

(defn on-mars [age] ;; <- arglist goes here
  ;; your code goes here
  (convert :mars age)
)

(defn on-jupiter [age] ;; <- arglist goes here
  ;; your code goes here
  (convert :jupiter age)
)

(defn on-saturn [age] ;; <- arglist goes here
  ;; your code goes here
  (convert :saturn age)
)

(defn on-uranus [age] ;; <- arglist goes here
  ;; your code goes here
  (convert :uranus age)
  )

(defn on-neptune [age] ;; <- arglist goes here
  ;; your code goes here
  (convert :neptune age)
)
