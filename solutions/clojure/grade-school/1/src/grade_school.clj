(ns grade-school)

(defn merge-class-vecs [v1 v2]
  (into [] (concat v1 v2))
  )

(defn grade [school grade]  
 (if (contains? school grade) 
   (school grade)
   []) 
)

(defn add [school name grade]  
    (merge-with merge-class-vecs  school {grade [name]})
)

(defn sort-students [school]
  (into {} (for [[k v] school]
             [k (into [] (sort v))]))
  )

(defn sorted [school]  
  (into (sorted-map) (sort-students school) )
)
