(ns triangle)


(defn triangle-equality? [a b c]
  (>= (reduce + (rest (sort > [a b c]))) (first (sort > [a b c])))
)

(defn is-valid? [a b c] ;; <- arglist goes here
  ;; your code goes here
  (and (and (pos? a) (pos? b) (pos? c))
       (triangle-equality? a b c ))
)

(defn equilateral? [a b c] ;; <- arglist goes here
  ;; your code goes here
  (and (is-valid? a b c) (= a b) (= b c))
)


(defn isosceles? [a b c] ;; <- arglist goes here
  ;; your code goes here
  (and (is-valid? a b c)
  (pos?(reduce + (map (fn [bval] (if bval 1 0)) [(= a b) (= a c) (= b c)] ))))
)

(defn scalene? [a b c] ;; <- arglist goes here
  ;; your code goes here
  (and (is-valid? a b c) (not= a b) (not= b c) (not= a c))
)

(defn is-degenerate? [a b c]
(and (is-valid? a b c) 
     (= (reduce + (rest (sort > [a b c]))) (first (sort > [a b c])))
     )                  
)
