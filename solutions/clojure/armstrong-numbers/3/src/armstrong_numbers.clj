(ns armstrong-numbers)

(defn non-neg-power [n k]
  ;; thirs iteration: promote to bigint
  (reduce *' (repeat k n)) )

(defn list-of-digits  [n]
  ;; using Thrush operator here, too 
  (map #(Integer/parseInt %)
    (-> (str n)
      (clojure.string/split #"(?=[0-9])")
     )))

(defn armstrong? [num] 
  (let  [dlist (list-of-digits num)]
    (let [k (count dlist)]
      (->>
        dlist
        (map #(non-neg-power % k))
        (reduce +)
        (= num)))))
