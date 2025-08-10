(ns sieve)

(defn sieve [N] 
  (loop [ p-list (vec (range 2 (inc N))) curr-p 2 k 2] 
      (let [to-remove (* k curr-p)]
          (if (> to-remove N) 
            (let [cp (first (filter #(> % curr-p) p-list))]
              (if (nil? cp)
                (filterv #(not (== % 0)) p-list)
                 (recur  p-list cp cp)))                
           (recur (mapv #( if (== % to-remove) 0 %) p-list) curr-p (inc k)) )
        )
      )
   )

