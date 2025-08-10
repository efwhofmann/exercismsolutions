(ns largest-series-product)

(defn make-number-seq [input]
       (map #(Integer/parseInt %)
            (clojure.string/split input #"(?=[0-9])"))
       )

(defn largest-product [span input-str] 
  {:pre [(not (neg? span))
         (<= span (count input-str) )] }
      (let [digits (make-number-seq input-str)]
       (->
        (for [idx (range (inc (- (count digits) span)))] 
          (reduce * (take span (drop idx digits) ))
        )
        sort
        last
       )
    )
)
