(ns nth-prime)

(defn is-composite? [n primes] 
    (some? (some #(zero? (mod n %)) primes)))

(defn get-primes [n]
  "Returns the first n primes"          
  (loop [next 3
         primes [2]]
    (if (= (count primes) n) primes
      (if (is-composite? next primes)
        (recur (+ next 2) primes)
        (recur (+ next 2) (conj primes next))))))

(defn nth-prime 
  "Returns the prime number in the nth position."
  [n]  
  (if (pos? n)
    (last (get-primes n))  
    (throw (IllegalArgumentException. "n must be >= 1."))))
