(ns series)

(defn slices [string length] 
  (if (zero? length) [""]
    (remove nil? (for [idx (range (min length (.length string)))]  
      (when (<= (+ idx length) (.length string))
        (subs string idx (+ idx length)))))))
