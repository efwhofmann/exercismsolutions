(ns simple-cipher)






(defn get-key-shift [key idx]
  (- (int (nth key (mod idx (count key)))) (int \a)))


(defn rotate-by 
  "Rotates char ch with shift"
  [shift ch]
  (let [ic (int ch) rc (+ ic shift)]
    (cond 
      (or (and (Character/isUpperCase ch) (> rc (int \Z)) )
          (and (Character/isLowerCase ch) (> rc (int \z)) ) ) 
        (char (- rc 26)) 
      (or  (and (Character/isUpperCase ch) (< rc (int \A)))
             (and (Character/isLowerCase ch) (< rc (int \a)) )) 
        (char (+ rc 26))
      :default (char rc)
    )))

(defn en-de-code 
  "En- or decodes text using the specified key"
  [key text operation]
  (let [ sign(if (= operation "decode") -1 1)]     
     (->> text  
          (map-indexed (fn [idx char]
                         (rotate-by (* (get-key-shift key idx) sign) char)))
          (map str)
          (clojure.string/join)
          )))


(defn rand-key
  "Returns a random key"
  []
  (clojure.string/join (map #(char (+ % (int \a))) (take 100 (repeatedly #(rand-int 25))))))

(defn encode 
  "Encodes text using the specified key, uses random key if key is blank"
  [key plaintext]
  (en-de-code (if (clojure.string/blank? key) (rand-key) key) plaintext "encode"))                                        


(defn decode
  "Decodes text using the specified key"
  [key ciphertext]
  (en-de-code key ciphertext "decode"))