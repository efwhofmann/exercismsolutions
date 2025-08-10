(ns largest-series-product)

(defn error-message? [span in-str in-chars]
  (cond (neg? span) "span must not be negative"
    (> span (count in-str) ) "span must be smaller than string length" 
    (> (count in-str) (count in-chars)) "digits input must only contain digits"
    :else nil))

(defn largest-product [span input-str] 
  (let [input-chars (clojure.string/split input-str #"(?=[0-9])")
        error (error-message? span input-str input-chars)]
      (when (some? error) (throw (IllegalArgumentException. error)))
         (let [digits (map #(Integer/parseInt %) input-chars)]
           (->
              (for [idx (range (inc (- (count digits) span)))] 
                (reduce * (take span (drop idx digits) )))
              sort
              last))))
