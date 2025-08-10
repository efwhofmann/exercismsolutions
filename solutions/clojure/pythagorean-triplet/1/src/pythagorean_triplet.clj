(ns pythagorean-triplet)

(defn make-triplet [n a]
     (let [na (- n a)
           numerator (+ (* a a) (* na na))
           denominator (* 2 na)]
         (when (zero? (mod numerator denominator)) 
           (let [c (/ numerator denominator)
                 b (- n c a)]
               (when (> b a)
                 (list a b c))
             ))))

(defn find-pythagorean-triplets
  "Given an integer N, it returns all Pythagorean triplets for which a + b + c = N"
  [N]
  (filter some? (map #(make-triplet N %) (range 1 (quot N 3))))
  )
