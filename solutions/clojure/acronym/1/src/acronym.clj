(ns acronym
   (:require [clojure.string :as str]))

(defn only-letters [s]
 (apply str (filter #(Character/isLetter %) s))
  )

(defn uppercase-first [s]
  (apply str (concat (str/upper-case (first s)) (rest s))))

(defn process [s]
  (if (= s (str/upper-case s)) (first s) 
    (apply str (filter #(Character/isUpperCase %) (seq (uppercase-first s))))))

(defn acronym  [phrase]
  (if (empty? phrase) "" 
 (str/join (map process (map only-letters (str/split (str/replace phrase "-" " " )  #"\s+")))))
  )
