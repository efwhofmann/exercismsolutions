(ns sum-of-multiples)


(defn sum-of-multiples [items, N] ;; <- arglist goes here
      ;; your code goes here
   (->> (for  [x (range 1 N) y items] (if (zero? (mod x y)) x)) 
     (remove nil?)
     (set)
     (reduce +)
     )
        
  )
