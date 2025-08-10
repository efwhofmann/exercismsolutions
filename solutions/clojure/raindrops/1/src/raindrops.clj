(ns raindrops
  (:require [clojure.string :refer [join]]))



(defn perhaps-pling [n]
  (if (zero? (mod n 3)) "Pling"  "")
  )

(defn perhaps-plang [n]
  (if (zero? (mod n 5)) "Plang"  "")
  )

(defn perhaps-plong [n]
  (if (zero? (mod n 7))"Plong"  "")
  )


(defn convert [number] ;; <- arglist goes here
      ;; your code goes here
  (let [rain 
        (join (str (perhaps-pling number) (perhaps-plang number) (perhaps-plong number)))] 
    (if (empty? rain) 
      (str number) rain))
)
