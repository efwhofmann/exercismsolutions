(ns protein-translation)

(def codon-map 
  {
                "AUG" "Methionine"
                "UUU" "Phenylalanine"
                "UUC" "Phenylalanine"
                "UUA" "Leucine"
                "UUG" "Leucine"
                "UCU" "Serine"
                "UCC" "Serine"
                "UCA" "Serine"
                "UCG" "Serine"
                "UAU" "Tyrosine"
                "UAC" "Tyrosine"
                "UGU" "Cysteine"
                "UGC" "Cysteine"
                "UGG" "Tryptophan"
                "UAA" "STOP"
                "UAG" "STOP"
                "UGA" "STOP"
   }
  )

(defn translate-codon [codon] ;; <- arglist goes here
      ;; your code goes here
  (if (not (= (count codon) 3)) (throw (IllegalArgumentException. "Must have three items in a Codon."))
    (get codon-map codon))
)

(defn translate-rna [rna-sequence] ;; <- arglist goes here
  ;; your code goes here
  (take-while #(not (= "STOP" %))
              (map translate-codon 
                   (map #(apply str %)(partition 3 rna-sequence)
                        )))
)
