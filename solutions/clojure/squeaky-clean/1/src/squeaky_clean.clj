(ns squeaky-clean
  (:require [clojure.string :as str]))

(defn upper-case-first [s] 
  (apply str (concat (str/upper-case (first s)) (rest s))))

(defn camel-if-hyphen [s]
  (if (str/includes? s "-") 
  	(let [vec (str/split s #"-")] 
  	(apply str (cons (first vec)
 		 (for  [idx (range 1 (count vec))] 
 		 	(upper-case-first (nth vec idx))
 		 )))
 	 ) 
   s)
 )

(defn letter-or-uscore? [ch]
  (or (Character/isLetter ch) 
      (.equals ch \_)
      )
  )


(defn is-lc-greek? [ch] 
  (and (>= (int ch) 945) (<= (int ch) 969)) 
  )

(defn clean
  "TODO: add docstring"
  [s]
  (apply str 
         (map #(if (not (is-lc-greek? %1)) %1 )
  (apply str (map #(if (letter-or-uscore? %) % ) 
      (camel-if-hyphen 
        (apply str  (map #(if (Character/isISOControl %1) "CTRL" %1)
         (str/replace s #" " "_") )
            )
          )
         ))
      ))
  )
