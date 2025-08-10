(ns state-of-tic-tac-toe)

(defn get-counts [board char]
 (or (get (frequencies (mapcat seq board)) char) 0)) 


(defn verify-board [board]
    (let [naughts (get-counts board \O)
          crosses (get-counts board \X)
          empty (get-counts board \ )]
      (cond
          (not (= (+ naughts crosses empty) 9)) (throw (IllegalArgumentException. "Wrong board format"))
          (> naughts crosses) (throw (IllegalArgumentException. "Wrong turn order: O started"))
          (> crosses (inc naughts)) (throw (IllegalArgumentException. "Wrong turn order: X went twice"))
          :else true)))

(defn line-wins [board player]
  (get (frequencies board) (clojure.string/join (repeat 3 player))))

(defn col-wins [board player]
  (get (frequencies (for [i (range 3)] (for [j (range 3)] (get-in board [j i])))) (repeat 3 player)) )


(defn count-diagonal-wins [board player]
  (let [line1 (clojure.string/split (nth board 0) #"")
        line2 (clojure.string/split (nth board 1) #"")
        line3 (clojure.string/split (nth board 2) #"")
        pl (str player)]
  (+ (if (and  (= (first line1) pl)
    (= (nth line2 1) pl)
    (= (last line3) pl)) 1 0)
     (if (and  (= (last line1) pl)
    (= (nth line2 1) pl)
    (= (first line3) pl)) 1 0))))

(defn count-wins [board player]
  (apply + (remove nil? (list (line-wins board player) (count-diagonal-wins board player) (col-wins board player)))))

(defn gamestate
  "Returns the gamestate of a tic-tac-toe board."
  [board]
  ;; function body
  (when (verify-board board)
    (let [cross-wins (count-wins board \X)
          naught-wins (count-wins board \O)]
      (if (and (> cross-wins 0) (> naught-wins 0))
        (throw (IllegalArgumentException. "Impossible board: game should have ended after the game was won"))
        (cond 
           (or (> cross-wins 0) (> naught-wins 0)) :win
           (zero? (get-counts board \ )) :draw 
           :else :ongoing
           )))))

