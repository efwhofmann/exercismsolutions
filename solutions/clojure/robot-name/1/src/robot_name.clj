(ns robot-name)

(def letters (mapv (comp str char (partial + 65)) (range 26)))

(defn serial-digits [length] (apply str (take length (repeatedly (partial rand-int 10)))))

(defn serial-letters [length] (apply str (take length (repeatedly #(rand-nth letters))))) 

(defn new-robot-name-candidate [] 
    (str (serial-letters 2) (serial-digits 3) )
    )

(def name-registry (ref #{}))


(defn robot [] 
     (ref {:name ""})
)

(defn robot-name [robot]
  (dosync 
  (while (empty? (:name @robot))
    (let [new-name (new-robot-name-candidate)] 
        (when (not (contains? @name-registry new-name)) (
              (alter robot update-in [:name] (constantly new-name))
              (alter name-registry conj new-name)
        ))
       ))
     (:name @robot)
    )
)

(defn reset-name [robot] 
  (dosync
    (alter robot update-in [:name] (constantly "")))
)
