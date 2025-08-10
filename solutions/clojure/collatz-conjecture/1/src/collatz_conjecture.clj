(ns collatz-conjecture)

(defn collatz-map [m]
  (if (even? m) (/ m 2) (+ (* m 3) 1))
  )

(defn collatz-rec [n i]
(if (> n 1) (collatz-rec (collatz-map n) (+ i 1)) i)  
)


(defn collatz [num] ;; <- arglist goes here
  ;; your code goes here
  (if (< num 1) (throw (IllegalArgumentException. (str "invalid input n:" num)) )
  (if (= num 1) 0  
    (collatz-rec num 0))
    )
 )
