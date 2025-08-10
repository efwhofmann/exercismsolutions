(ns matching-brackets)

(def delim-map {40 :lparen, 41 :rparen, 123 :lbrace, 125 :rbrace,
                91 :lbrack, 93 :rbrack} )

(defn char-to-delim [c]
  (get delim-map (int c))
  )


(defn closes? [d-one d-two]
  (condp = d-one
    :lparen (= d-two :rparen)
    :lbrace (= d-two :rbrace)
    :lbrack (= d-two :rbrack)
    false
    )
  )

(defn char-is-delim? [c] 
  (some #(= (int c) %) (keys delim-map))
  )


(defn str-to-delim-list [str]
  (remove nil?  
          (map #(when (char-is-delim? %) (char-to-delim %) ) str)
          )
        )

(defn valid? [str] 
  (let [fifo (str-to-delim-list str)] 
  	(if (= (mod (count fifo)  2) 1) false
  	(loop [lifo () idx 0]
  	  (if (= idx (count fifo)) 
  	 	(zero?  (count lifo))  
   		(let  [p-sym (nth fifo idx)]
  			(if (or (zero? (count lifo)) (not (closes? (first lifo) p-sym)) )
  			   (recur (conj lifo p-sym ) (inc idx))
  			   (recur (rest lifo) (inc idx))
  			   )
  		))
  		)
      ))
   )   