(ns eliuds-eggs)

(defn egg-count [number]
    (loop [sum 0 n number] 
      (if (not (pos? n))
        sum
        (recur (+ sum (bit-and n 1) ) (bit-shift-right n 1) ))))