(ns sum-of-multiples)

(defn multiple? [n base]
  (zero? (mod n base))
  )

(defn multiple-for-some? [bs n]
  (some #(multiple? n %) bs)
  )


(defn sum-of-multiples [itms, N] ;; <- arglist goes here
      ;; your code goes here
      (->>
        (range 1 N)
        (filter #(multiple-for-some? itms %))
        (apply +)
      )       
  )
