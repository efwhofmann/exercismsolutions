(ns matching-brackets)

(def closing-map {\[ \], \( \), \{ \}})

(defn closes? [d-one d-two]
  (= d-two (closing-map d-one)))

(defn is-left-delim? [c]
  (contains? closing-map c))

(defn is-right-delim? [c]
  (contains? (set (vals closing-map)) c))

(defn valid? [str] 
  	(loop [lifo () fifo str]
      (if (zero? (count fifo)) 
        (zero? (count lifo))
          (let [cur (first fifo)]
            (cond
              (is-left-delim? cur) (recur (conj lifo cur) (rest fifo))
              (is-right-delim? cur) 
                (if (closes? (first lifo) cur)
                  (recur (rest lifo) (rest fifo))
                  false)                  
              :else (recur lifo (rest fifo)) )))))