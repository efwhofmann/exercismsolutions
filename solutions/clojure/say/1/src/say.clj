(ns say)

(def digit-map { 0 "zero" 1 "one"  2 "two" 3 "three" 4 "four"  5 "five" 6 "six" 7 "seven" 8 "eight" 9 "nine"})
(def teen-map {10 "ten" 11 "eleven" 12 "twelve" 13 "thirteen" 14 "fourteen" 
               15 "fifteen" 16 "sixteen" 17 "seveneen" 18 "eighteen" 19 "nineteen"})
(def tens-map {20 "twenty" 30 "thirty" 40 "forty"  50 "fifty"  60 "sixty"
               70 "seventy" 80 "eighty" 90 "ninety"})
(def powers-map {1000 "thousand"  1000000 "million" })

(defn get-digit[d]
  (get digit-map d))

(defn get-teen [t]
  (get teen-map t))

(defn get-tens [t]
  (get tens-map t))


(defn two-digit [num]
    (cond 
      (< num 10) (get-digit num)
      (< num 20) (get-teen num)
      :else (let [tens (* (quot  num 10) 10)]
        (let [ones (- num tens)]
        (str (get-tens tens)
        (if (not (== 0 ones)) (str "-"(get-digit ones)) ""  ))))
        )  
        )


(defn hundreds [num]
  (if (<= num 99) (two-digit num)
   (str (get-digit (quot num 100)) " hundred" (if (> (rem num 100) 0) (str " " (two-digit (rem num 100))) ) )
    )
  )

(defn thousands [num]
  (if (<= num 999) (hundreds num)
    (str (hundreds (quot num 1000)) " thousand" (if (> (rem num 1000) 0) (str " " (hundreds (rem num 1000)))) ))
  )

(defn millions [num]
  (if (<= num 999999) (thousands num)
    (str (thousands (quot num 1000000)) " million" (if (> (rem num 1000000) 0) (str " " (thousands (rem num 1000000)))) ))
  )

(defn billions [num]
   (if (<= num 999999999) (millions num)
    (str (millions (quot num 1000000000)) " billion" (if (> (rem num 1000000000) 0) (str " " (millions (rem num 1000000000)))) ))
  )


(defn number [num] ;; <- arglist goes here
  ;; your code goes here
  (if (and (>= num 0 ) (<= num 999999999999) )
    (billions num)
    (throw (IllegalArgumentException." "))
    )
)
