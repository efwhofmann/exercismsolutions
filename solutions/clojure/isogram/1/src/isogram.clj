(ns isogram)

(defn spc-or-hyphen? [chr] 
(or (= chr \-) (= chr \space))       
       )

(defn isogram? [phrase] ;; <- arglist goes here
  ;; your code goes here
(let [letters (filter #( not (spc-or-hyphen? %)) 
                      (clojure.string/lower-case phrase))]
  (= (count (set letters)) (count letters) )
  )
)
