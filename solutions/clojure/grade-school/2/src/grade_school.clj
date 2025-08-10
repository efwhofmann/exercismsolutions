(ns grade-school)

(defn grade [school grade]  
 (if (contains? school grade) 
   (school grade)
   []) 
)

(defn merge-class-vecs [v1 v2]
  (into [] (concat v1 v2))
  )

(defn add [school name grade]  
    (merge-with merge-class-vecs  school {grade [name]})
)

(defn sorted [school]  
  (into (sorted-map) (for [[k v] school]
             [k (into [] (sort v))]))
)
