(ns isbn-verifier)

(defn only-valid-chars? [str]
  (nil? (re-find #"[^-0-9X]" str))
  )

(defn transcribe [isbn]
  (let [last-idx (dec (count isbn))]
  (filter some? (map (fn[c] (cond
                              (= c 45) nil
                              (= c 88) 10 
                              :else  (- c 48)
                              )) (map int isbn))))
  )

(defn correct-X? [digits]
  (empty? (filter false? (map-indexed #(if (and (== %2 10) (< %1 9)) false true) digits)))
  ) 

(defn isbn? [isbn] ;; <- arglist goes here
  ;; your code goes here
  (if (only-valid-chars? isbn)(
      let [digits (transcribe isbn)] 
           (if (and (= (count digits) 10) (correct-X? digits)) 
             (== 0 (mod (reduce + (map-indexed #(* %2 (- 10 %1)) digits)) 11))
             false
           )
         )             
    false)
)
