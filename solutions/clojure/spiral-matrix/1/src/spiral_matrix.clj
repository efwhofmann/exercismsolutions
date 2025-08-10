(ns spiral-matrix)
(require '[clojure.set :as cs])

(def start-pos '(1 1))
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
    (map #(+ %1 %2) pos (deltas dir))
    )

(defn can-move-on? [smatrix-map idx dir n]  
    (let [new-pos (advance (smatrix-map idx) dir) in-bounds? (fn[x](and (> x 0) (<= x n)))] 
      (and ;; in bounds ?
       (and (in-bounds? (first new-pos)) (in-bounds? (last new-pos)))
       ;; not occupied ?
       (not (contains? (set (vals smatrix-map)) new-pos)))
    ))


(defn make-smatrix-map [n]
(loop [smatrix-map {1 start-pos} idx 1 dir inital-dir] 
    (if (== idx (* n n)) smatrix-map
        ( if (can-move-on? smatrix-map idx dir n) (recur (conj smatrix-map {(inc idx) (advance (smatrix-map idx) dir)}) (inc idx) dir)
        (recur (conj smatrix-map {(inc idx) (advance (smatrix-map idx) (turn dir))}) (inc idx) (turn dir))))        
        )
    )

(defn smatrix-as-list [n]
    (let [sm (cs/map-invert (make-smatrix-map n))]
        (for [i (range 1 (inc n)) j (range 1  (inc n))] (get sm [i j]))))


(defn spiral [n] 
    (if (> n 0)
    (partition n (smatrix-as-list n))
    ())
)
