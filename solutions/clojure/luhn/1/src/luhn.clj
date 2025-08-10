(ns luhn)

(defn- clean-str [input] 
     (clojure.string/replace input #"\s" "")                       
    )

(defn- digit-list [input]
  (map #(Integer/parseInt %)
   (clojure.string/split (clean-str input)
    #"(?=[0-9])"))
  )

(defn- get-even-digits [input] 
   (let [dgts (reverse (digit-list input))] 
      (for [idx (range 1 (count dgts) 2)] (nth dgts idx))
    )
  )

(defn- get-odd-digits [input] 
   (let [dgts (reverse (digit-list input))] 
      (for [idx (range 0 (count dgts) 2)] (nth dgts idx))
    )
  )

(defn- double-or-nine [digit] 
  (let [dd (* digit 2)] 
    (if (<= dd 9) dd (- dd 9))
    )  
  )

(defn- ten-divides? [n] 
       (zero? (mod n 10))
       )

(defn- invalid-input? [str_in] 
  (or (not (nil? (re-find #"(?=[A-Za-z-_./+=$£])" str_in) ))
    (<= (count (clean-str str_in)) 1) )
  )
  
(defn valid? [nb_str] ;; <- arglist goes here
  ;; your code goes here
  (if (invalid-input? nb_str) false 
    (let [even-d (get-even-digits nb_str) odd-d (get-odd-digits nb_str)]
     (ten-divides? (reduce + (concat 
       (map double-or-nine even-d)
       odd-d))
      ))
 )
)
