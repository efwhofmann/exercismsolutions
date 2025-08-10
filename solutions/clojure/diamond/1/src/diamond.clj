(ns diamond)

(defn make_spaces [k]
  (apply str (repeat k " "))
  )

(defn make_line [[k l chr]]
  (if (zero? l)
    (str (make_spaces k) chr (make_spaces k))
    (str
     (make_spaces k) chr (make_spaces (dec (* l 2))) chr (make_spaces k))
    )
  )

(defn make_level_line [[width level]] 
  (make_line [(- width level) level (char (+ (int \A ) level))] )
  )

(defn diamond [letter] 
  (let [d (- (int letter) (int \A))]
    (for [idx (range (- d) (inc d))]
        (make_level_line [d (- d (abs idx))] )
      )
    )    
)
