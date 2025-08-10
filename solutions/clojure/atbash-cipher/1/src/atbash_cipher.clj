(ns atbash-cipher
 (:require [clojure.string :as st]))



(defn atb_encode [c] 
  (let [ic (int c)]
    (cond (>= ic 97 ) (char (- 122 (- ic 97)))
        (>= ic 48) c     
      )
    )
)

 
(defn encode [input] ;; <- arglist goes here
  ;; your code goes here
  (->>
    (st/replace input #"\W+" "")
    st/lower-case
    (map atb_encode)
    (partition-all 5)
    (map #(apply str %))
    (st/join " ")
    )
 )
