(ns pangram)
(require  '[clojure.string :as st])

(defn is-letter?[ch]
  (and 
  (>=  (int ch) (int \a)) 
    (<= (int ch) (int \z)))
  )

(defn pangram? [sentence]
  (== (count (set (filter #(is-letter? %) (st/lower-case sentence)))) 26)
)
