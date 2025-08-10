(ns nth-prime)

(defn is-multiple? [n primes] 
    (some? (some #(zero? (mod n %)) primes)) 
  )

(defn nth-prime 
  "Returns the prime number in the nth position."
  [n] ;; <- arglist goes here
  ;; your code goes here 
  (if (pos? n)
  (loop [idx 1
         next 2
         primes []]
    (if (> idx n) (last primes) 
    (if (is-multiple? next primes)
      (recur idx (inc next) primes)
      (recur (inc idx) (inc next) (conj primes next))
    )))
    (throw (IllegalArgumentException. "n must be >= 1.") )
    )
  )
