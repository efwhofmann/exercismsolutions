(ns word-count)
(require '[clojure.string :as str])

(defn word-count [s] 
  (frequencies (filter #(not (empty? %)) (str/split (str/lower-case s) #"\s|[^a-z0-9']|'\B|\B'")))
)
