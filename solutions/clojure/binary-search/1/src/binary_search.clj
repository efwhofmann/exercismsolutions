(ns binary-search)


(defn mid-idx [low hi] 
  (quot (+ low hi) 2)
)

(defn search-for [key numbers]
    (loop [low 0 high (dec (count numbers)) mid (mid-idx low high) ] 
        (if (> low high) (throw (Exception."not found"))
        (let [value (nth numbers mid)]
            (cond 
                (< value key) (recur (inc mid) high (mid-idx (inc mid) high))
                (> value key) (recur low (dec mid) (mid-idx low (dec mid)) )
                (== value key) mid
            )
        ))
    )
)

(defn middle [numbers] 
    (mid-idx 0 (dec (count numbers)))
)


