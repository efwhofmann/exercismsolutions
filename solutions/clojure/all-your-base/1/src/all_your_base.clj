(ns all-your-base)

(def a-power 
  (memoize (fn[a n] 
          (if (== n 0) 1 
             (* a (a-power a (dec n)))))
       )
  )

(defn coeff-to-int [a coeffs] 
  (reduce + (map-indexed #(* (a-power a %1) %2) (reverse coeffs)))
  )

(defn int-to-coeff [b num]
  (loop [coeffs '() n num]
    (if (< n b) (conj coeffs n) 
      (recur (conj coeffs (rem n b)) (quot n b)))
    )
  )

(defn valid? [a coeffs b]
    (and (> a 1) (not (empty? coeffs)) (not (some #(or (>= % a) (< % 0)) coeffs))  (> b 1))
  )

(defn convert [a coeffs b] 
  (if (valid? a coeffs b)
  (int-to-coeff b (coeff-to-int a coeffs))
  nil )  
)
