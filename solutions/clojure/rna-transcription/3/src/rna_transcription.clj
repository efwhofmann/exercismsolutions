(ns rna-transcription)

(defn is-invalid? [dna]
  (some? (re-find #"(?=[BD-FH-S-Za-z0-9])" dna))
)

(defn to-rna [dna]  
    (if (is-invalid? dna)
      (throw (AssertionError.))
      (apply str (map {\G \C \C \G \T \A \A \U} dna))
      )    
 )