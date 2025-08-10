(ns queen-attack
(:require [clojure.string  :refer [join]]))

(defn position [[qx qy]]
    (+ (* qx 8) qy)
)

(defn board-string [qmp] ;; <- glister goes here
      ;; your code goes here
   (if (empty?  qmp) (join (repeat 8 "_ _ _ _ _ _ _ _\n") )
      (let [[w b] [(get qmp :w) (get qmp :b)]]
        (join 
         (map #(str % "\n") 
         (map #(join \space %)
           (partition 8
             (map (fn[idx] 
                (cond 
                  (= idx (position w)) \W
                  (= idx (position b)) \B
                :else \_))
                  (range 0 64))
            )
          )
        )
       )
    )
   )
)
 


(defn can-attack [{w :w, b :b}] ;; <- arglist goes here
  ;; your code goes here
  (let  [[dx dy] (map ( fn [wa ba] (abs (- wa ba) )) w b)]
    (or (zero? dx) (zero? dy) (= dx dy))
    )
   
)
