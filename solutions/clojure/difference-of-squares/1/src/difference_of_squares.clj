(ns difference-of-squares)



(defn sum-of-squares [N] ;; <- arglist goes here
  ;; your code goes here
  (reduce + (map (fn [k] (* k k)) (take (+ N 1) (range))))
)

(defn square-of-sum [N] ;; <- arglist goes here
  ;; your code goes here
  ;;(let [k (reduce + (take (+ N 1) (range)))] (* k k))
  (let [k (/ (* N (+ 1 N)) 2)] (* k k))
 )

(defn difference [N] ;; <- arglist goes here
  ;; your code goes here
 (abs (- (square-of-sum N) (sum-of-squares N)))
)
