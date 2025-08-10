(ns nucleotide-count)
(require '[clojure.string :as str])


(defn nucleotide-counts [strand] 
  (merge {\A 0 \G 0 \C 0 \T 0}(frequencies strand))
)

(defn count-of-nucleotide-in-strand [nucleotide strand] 
  {:pre [(#{\A \C \G \T} nucleotide)]}
   ((nucleotide-counts strand) nucleotide)
)
