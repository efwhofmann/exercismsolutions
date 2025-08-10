(ns rna-transcription)

(defn to-compl [nucl] 
  (cond (= nucl \G) \C 
    (= nucl \C) \G 
    (= nucl \T) \A 
    (= nucl \A) \U)
  )

(defn is-invalid? [dna]
  (some? (re-find #"(?=[BD-FH-S-Za-z0-9])" dna))
)

(defn to-rna [dna]  
    (if (is-invalid? dna)
      (throw (AssertionError.))
      (apply str (map to-compl dna))
      )    
 )