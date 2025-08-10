(ns sublist)

(defn is-sublist? [a b]
  (some #(= a %) (partition (count a) 1 b)) 
  )

(defn classify [list1 list2] ;; <- arglist goes here
      ;; your code goes here
  (cond (= list1 list2) :equal 
    (= [] list1) :sublist
    (= [] list2) :superlist
    (is-sublist? list1 list2) :sublist
    (is-sublist? list2 list1) :superlist
    :else :unequal
    )
    
)
