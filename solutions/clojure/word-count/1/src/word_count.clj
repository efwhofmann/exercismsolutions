(ns word-count)
(require '[clojure.string :as str])

(defn word-count [s] ;; <- arglist goes here
  ;; your code goes here
  (apply merge-with + (map #(assoc {} %1 1) (filter #(not (empty? %)) (str/split (str/lower-case s) #"\s|[^a-z0-9']|'\B|\B'"))))
)
