(ns crypto-square
  (:require [clojure.string :as st]))

(defn normalize-plaintext [input] 
  (st/replace (st/lower-case input) #"\W+" "")
)

(defn square-size [input] 
  (int (Math/ceil (Math/sqrt (count input))))
)

(defn plaintext-segments [input] 
  (let [msg (normalize-plaintext input) c (square-size msg)]
  (map #(apply str %) (partition c c nil msg)))
)

(defn read-column [col seg]
  (if (> (count seg) col) (nth seg col) )
  )

(defn ciphertext [input] 
  (let [segs (plaintext-segments input) c (count (first segs))]
  (st/join 
   (for [col (range 0 c)]
  (apply str (map #(read-column col %) segs ))
          )))
)

(defn get-rect [n] 
  (let [r (int (Math/ceil (Math/sqrt n)))] 
    (if (>= (* (dec r) r) n) (list (dec r) r)(list r  r))))

(defn get-n-to-pad [msg] 
  (let [l (count msg)] 
    (- (reduce * (get-rect l)) l))) 

(defn take-f-chunks [msg n len] 
  (for [i (range 0 (* n len) len)] 
    (subs msg i (+ i len)))) 

(defn take-b-chunks [msg n len] 
  (for [i (range (-  (count msg) (* n len)) (count msg) len)] 
    (str (subs msg i (+ i len))" "))) 


(defn normalize-ciphertext [input] 
  (let [cph (ciphertext input) n (get-n-to-pad cph) 
        l (first (get-rect (count cph)))
        k (- (second  (get-rect (count cph))) n)]
	        (st/join " " (concat 
                          (take-f-chunks cph k l) 
                          (take-b-chunks cph n (dec l)) ))
	)
  )
