(ns anagram)


(defn letter-map[string]
	(apply merge-with + (map (fn[ch] {ch 1}) string))
) 

(defn is-anagram?[word candidate]
(let [lc-word (clojure.string/lower-case word) lc-cand (clojure.string/lower-case candidate)]
  (if (not (= lc-word lc-cand))
    (= (letter-map lc-word) (letter-map lc-cand))
    false
  ))
)


(defn anagrams-for [word prospect-list] 
  (filterv (partial is-anagram? word) prospect-list )
)
