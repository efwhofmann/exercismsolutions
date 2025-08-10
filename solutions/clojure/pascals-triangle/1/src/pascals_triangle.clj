(ns pascals-triangle)


(def binom 
  (memoize (fn  [n k] 
             (condp = [n k] 
               [0 0] 1 
               (if (or (= k 0) (= k n)) 1  
                 (bigint 
                  (+ (binom (dec n) k) (binom (dec n) (dec k)))))))))

              


(defn row [num] ;; <- arglist goes here
  ;; your code goes here
  (for [k (range 0 num)] (binom (dec num) k))
)

(def triangle
  (map #(row (inc %)) (range) )
  )
