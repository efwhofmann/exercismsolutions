(ns sieve)

(defn sieve [N] 
  (loop [ p-list (vec (range 2 (inc N))) curr-p 2 k 2] 
    (if (nil? curr-p) 
      (filterv #(not (== % 0)) p-list)
      (let [to-remove (* k curr-p)]
          (if (> to-remove N) (recur  p-list (first (filter #(> % curr-p) p-list)) 2)
               (recur (mapv #( if (== % to-remove) 0 %) p-list) curr-p (inc k)) )
        )
      )
   )
)
