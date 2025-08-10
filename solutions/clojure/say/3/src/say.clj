(ns say)

(def digit-map { 0 "zero" 1 "one"  2 "two" 3 "three" 4 "four"  5 "five" 6 "six" 7 "seven" 8 "eight" 9 "nine"})
(def teen-map {10 "ten" 11 "eleven" 12 "twelve" 13 "thirteen" 14 "fourteen" 
               15 "fifteen" 16 "sixteen" 17 "seveneen" 18 "eighteen" 19 "nineteen"})
(def tens-map {20 "twenty" 30 "thirty" 40 "forty"  50 "fifty"  60 "sixty"
               70 "seventy" 80 "eighty" 90 "ninety"})
(def powers [{:number 1000 :name " thousand"} {:number 1000000  :name " million"} {:number 1000000000 :name " billion"}])

(defn two-digit [num]
    (cond 
      (< num 10) (digit-map num)
      (< num 20) (teen-map num)
      :else (let [tens (* (quot  num 10) 10)]
        (let [ones (- num tens)]
        (str (tens-map tens)
        (if (not (== 0 ones)) (str "-" (digit-map ones)) ""  ))))))


(defn hundreds [num]
  (if (<= num 99) (two-digit num)
   (str (digit-map (quot num 100)) " hundred" (if (> (rem num 100) 0) (str " " (two-digit (rem num 100)))))))



(defn by-ten-powers [num idx]
  (if (< idx 0) (hundreds num)
  (let [current-power (get (nth powers idx) :number)]
    (if (<= num (dec current-power)) (by-ten-powers num (dec idx)) 
      (str (by-ten-powers (quot num current-power) (dec idx)) (get (nth powers idx) :name) 
           (if (> (rem num current-power) 0) (str " " (by-ten-powers (rem num current-power) (dec idx)))))))))
  
(defn number [num]
  ;; spells out integer num to an english number
  (if (and (>= num 0 ) (<= num 999999999999) )
    (by-ten-powers num 2)
    (throw (IllegalArgumentException." "))))