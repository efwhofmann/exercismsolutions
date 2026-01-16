(ns kindergarten-garden)
(require '[clojure.string :as str])

(def plants {\G :grass \C :clover \R :radishes \V :violets})
(def students {0 :alice 1 :bob 2 :charlie 3 :david 4 :eve 5 :fred 6 :ginny 7 :harriet 8 :ileana 9 :joseph 10 :kincaid 11 :larry})

(defn partitioned [diagram]
  (map #(partition 2 %)(map seq (str/split diagram #"\n"))))

(defn garden [diagram]
  (apply merge-with into
    (for [row (partitioned diagram)]
      (into (hash-map) (for [[k v] (map-indexed vector row)]
                   [(students k) (into [] (map #(plants %) v))])))))