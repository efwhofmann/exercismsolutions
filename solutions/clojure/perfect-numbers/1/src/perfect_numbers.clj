(ns perfect-numbers)



(defn sigma_n [n]
   (reduce + (filter #(zero? (mod n %)) (range 1 n)))
  )

(defn classify [num] ;; <- arglist goes here
      ;; your code goes here
  (if (<= num 0) (throw (IllegalArgumentException."Argument must be positive." )) 
  (let [s (sigma_n num)] 
      (cond 
        (== s num ) :perfect
        (> s num) :abundant
        :else :deficient
        )
    ))
)
