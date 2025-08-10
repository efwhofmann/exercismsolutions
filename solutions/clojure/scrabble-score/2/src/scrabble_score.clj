(ns scrabble-score)



(defn score-letter [letter] ;; <- arglist goes here
      ;; your code goes here
 (let [l (clojure.string/lower-case letter)]
   (cond 
     (contains? #{"a" "e" "i" "o" "u" "l" "m" "n" "r" "s" "t"} l) 1
     (contains? #{"d" "g"} l) 2
     (contains? #{"b" "c" "m" "p"} l) 3
     (contains? #{"f" "h" "v" "w" "y"} l) 4
     (contains? #{"k"} l) 5
     (contains? #{"j" "x"} l) 8
     (contains? #{"q" "z"} l) 10
   ))
)

(defn score-word [word] ;; <- arglist goes here
  ;; your code goes here
  (reduce + (map score-letter word))
)
