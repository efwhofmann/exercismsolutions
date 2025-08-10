(ns hexadecimal)

(defn valid? [str]
  (nil? (re-find #"[^0-9a-fA-F]" str))
  )

(defn to-number [hex-ch]
   (let [num (int hex-ch)] 
   	(if (and (>= num  (int \0)) (<= num (int \9))) 
  	     (- num (int \0)) 
      	 (+ (- num (int \a) ) 10))
     )
  )
 
(def hex-power  
 	(memoize 
 	(fn [n] (if (== n 0) 1 (* 16 (hex-power (dec n) )))
 	))
  )

(defn read-digits [str]
      (map to-number (reverse (clojure.string/lower-case str)))
  )

(defn calculate-terms [digit-seq]
 	 (map-indexed #(* (hex-power %1) %2) digit-seq)
  )

(defn hex-to-int [str]
  (if (valid? str)
  	(->> str
  		(read-digits)
  		(calculate-terms)	
  		(reduce +)	
  	)
    0)
 )