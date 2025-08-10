(ns trinary)

(def power (atom 1))

(defn valid?[str]
  (nil? (re-find #"\D|[3-9]" str))
  )

(defn reset-pow[]
  (reset! power 1)
  )

(defn three-pow[]
  (let [cur-pow @power]
    (do 
    (swap! power #(* % 3))
    cur-pow 
    )
  )
)

(defn to-decimal [str] ;; <- arglist goes here
      ;; your code goes here
(if (not (valid? str)) 0 
  (do (reset-pow)
  (reduce + (map #(* (three-pow) %) 
                 (map #(- (int %) (int \0)) (reverse str))))
  ))
)
