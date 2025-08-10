(ns largest-series-product)

(defn error-message? [span in-str in-list]
  (cond (neg? span) "span must not be negative"
    (> span (count in-str) ) "span must not exceed string length" 
    (> (count in-str) (count in-list)) "digits input must only contain digits"
    :else nil))

(def get-list #(clojure.string/split % #"(?=[0-9])"))
(defn get-digits [in] (map #(Integer/parseInt %) in))

(defn largest-product [span input-str] 
  (let [input-list (get-list input-str)
        error (error-message? span input-str input-list)]
      (when (some? error) (throw (IllegalArgumentException. error)))
         (->> (get-digits input-list)
             (partition span 1 [0])
             (map #(reduce * %))
             (apply max))))
