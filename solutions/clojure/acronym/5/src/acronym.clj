(ns acronym
   (:require [clojure.string :as str]))

(defn only-letters [s]
 (apply str (filter #(Character/isLetter %) s))
  )

(defn uppercase-first [s]
  (apply str (concat (str/upper-case (first s)) (rest s))))

(defn caps-only [s]
  (->> (uppercase-first s)
         (seq) 
         (filter #(Character/isUpperCase %))
         (apply str)))
  

(defn process [s]
  (let  [caps (caps-only s)] 
  (if (= (count s) (count caps)) (first caps) caps)))

(defn acronym  [phrase]
  (if (empty? phrase) "" 
   (->> (str/split (str/replace phrase "-" " " )  #"\s+")
        (map only-letters)
        (map process)
        (apply str)))
  )
