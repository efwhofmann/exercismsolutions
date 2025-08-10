(ns series)

(defn get-error-msg [len-str len-sl]
  (if (zero? len-sl)
    "slice length cannot be zero"
    (if (< len-sl 0)
      "slice length cannot be negative"
      (if (zero? len-str)
        "series cannot be empty"
        (when (> len-sl len-str)
          "slice length cannot be greater than series length"
          )))) )

(defn valid [len-string len-slice]
  (let [msg (get-error-msg len-string len-slice)]
    (if (nil? msg)
      true
      (throw (IllegalArgumentException. msg)))))
   

(defn slices [string length] 
  (when (valid (.length string) length)
    (remove nil? (for [idx (range (inc (- (.length string) length)))]  
      (when (<= (+ idx length) (.length string))
        (subs string idx (+ idx length)))))) )
