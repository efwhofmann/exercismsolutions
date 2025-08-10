(ns bob)
  (require '[clojure.string :as st])

(def responses {:silence "Fine. Be that way!", :question "Sure.", :yelled "Whoa, chill out!", :yelledq "Calm down, I know what I'm doing!", :normal "Whatever."})

(defn is_silence? [s]
  (nil? (re-find #"\S" s))
  )

(defn is_question? [s]
  (= (last (st/trim s)) \?)
  )

(defn is_yelling? [s]
   (and (some? (re-find #"\p{Lu}" s)) (nil? (re-find #"\p{Ll}" s)))
  )

  

(defn response-for [s] 
  (cond
    (is_silence? s)  (responses :silence)
    (and (is_question? s) (is_yelling? s))  (responses :yelledq)
    (is_question? s)  (responses :question)    
    (is_yelling? s)  (responses :yelled)
    :default  (responses :normal)
    )
  
)
