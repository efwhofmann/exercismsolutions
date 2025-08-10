(ns knapsack)

(defn maximum-value
  "Calculates the maximum value that can be packed."
  [maximum-weight items]
  (if (empty? items) 0
    (let [num-items (count items)
          empty-table (vec (repeat (inc num-items) (vec (repeat (inc  maximum-weight) 0))))]      
      (loop [idx 0 
       wgt 1
       table empty-table]
        (if (>= idx num-items) 
          (get-in table [num-items maximum-weight])
         (if (> wgt maximum-weight)
          (recur (inc idx) 1 table)
          (let [cur (nth items idx)
                prev-val (get-in table [idx wgt])]
              (if (>= wgt (:weight cur))
                (recur idx (inc wgt) 
                       (update-in table [(inc idx) wgt]
                          (constantly
                            (max prev-val 
                               (+ (:value cur)
                                  (get-in table 
                                    [idx (- wgt (:weight cur)) ] )))))
                                   )
                (recur idx (inc wgt) 
                       (update-in table [(inc idx) wgt] 
                                  (constantly prev-val)))
              
                  ))))))))
