(ns spiral-matrix)
(require '[clojure.set :as cs])

(def start-pos [0 0])
(def inital-dir :east)
(def deltas {:east '(0 1), :south '(1 0), :west '(0 -1), :north '(-1 0)})  

(defn turn [dir] 
    (condp = dir 
        :east :south
        :south :west
        :west :north
        :north :east
    ))   

(defn advance [pos dir]
    (mapv #(+ %1 %2) pos (deltas dir))
    )

(defn can-move-on? [n sm pos dir]  
    (let [new-pos (advance pos dir) in-bounds? (fn[x](and (>= x 0) (< x n)))] 
      (and ;; in bounds ?
       (and (in-bounds? (first new-pos)) (in-bounds? (last new-pos)))
       ;; not occupied ?
        (zero? (get-in sm new-pos)) )
    ))

(defn spiral-as-matrix [n]
(let [m-zero (vec (repeat n (vec (repeat n 0))))]
    (loop [sm  (update-in m-zero start-pos (constantly 1)) pos start-pos dir inital-dir k 1]
    (if (== k (* n n)) sm
        (if (can-move-on? n sm pos dir) 
            (recur 
            (update-in sm (advance pos dir) (constantly (inc k)))     (advance pos dir) dir (inc k) ) 
            (recur
            (update-in sm 
                       (advance pos (turn dir)) (constantly (inc k))) (advance pos (turn dir))  (turn dir)  (inc k)) 
        ))
    ))
 )

(defn spiral [n] 
(if (> n 0)
  (partition n (flatten (spiral-as-matrix n)))
  ())
)
