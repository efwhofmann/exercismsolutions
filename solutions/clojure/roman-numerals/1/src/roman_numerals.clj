(ns roman-numerals)

(def a-to-roman-map {1000 "M", 900 "CM", 500 "D", 400 "CD", 100 "C", 90 "XC", 
       50 "L", 40 "XL", 10 "X", 9 "IX", 5 "V", 4 "IV", 1 "I"} )

(defn numerals [number] ;; <- arglist goes here
      ;; your code goes here
  (let [key-nums (sort (comp - compare) (keys a-to-roman-map))] 
    (loop [numerals [] num number idx 0]
      (let [curr (nth key-nums idx)]
      (if (zero? num) (clojure.string/join numerals) 
        (if (< num curr) 
          (recur numerals num (inc idx)) 
          (recur (conj numerals (get a-to-roman-map curr)) (- num curr) idx) )
        ))      
      )
    )
)
