(ns state-of-tic-tac-toe)

(defn get-counts [board char]
    (count (filter #(= % char)  (clojure.string/split (clojure.string/join board) #""))))

(defn verify-board [board]
    (let [naughts (get-counts board "O")
          crosses (get-counts board "X")
          empty (get-counts board " ")]
      (cond
          (not (= (+ naughts crosses empty) 9)) (throw (IllegalArgumentException. "Wrong board format"))
          (> naughts crosses) (throw (IllegalArgumentException. "Wrong turn order: O started"))
          (> crosses (inc naughts)) (throw (IllegalArgumentException. "Wrong turn order: X went twice"))
          :else true)))

(defn line-win? [board no player]
  (= (nth board no) (clojure.string/join (repeat 3 player)))) 

(defn count-line-wins [board player]
  (count (filter #(line-win? board % player) (list 0 1 2))))

(defn count-diagonal-wins [board player]
  (let [line1 (clojure.string/split (nth board 0) #"")
        line2 (clojure.string/split (nth board 1) #"")
        line3 (clojure.string/split (nth board 2) #"")]
  (+ (if (and  (= (first line1) player)
    (= (nth line2 1) player)
    (= (last line3) player)) 1 0)
     (if (and  (= (last line1) player)
    (= (nth line2 1) player)
    (= (first line3) player)) 1 0))))

(defn column-win? [board no player]
  (= 3 (count (filter #(= (str %) player) (list (nth (nth board 0) no)
  (nth (nth board 1) no)
  (nth (nth board 2) no) )))))

(defn count-column-wins [board player]
  (count (filter #(column-win? board % player) (list 0 1 2))))

(defn count-wins [board player]
  (+ (count-line-wins board player) (count-diagonal-wins board player) (count-column-wins board player)))


(defn gamestate
  "Returns the gamestate of a tic-tac-toe board."
  [board]
  ;; function body
  (when (verify-board board)
    (let [cross-wins (count-wins board "X")
          naught-wins (count-wins board "O")]
      (if (and (> cross-wins 0) (> naught-wins 0))
        (throw (IllegalArgumentException. "Impossible board: game should have ended after the game was won"))
        (cond 
           (or (> cross-wins 0) (> naught-wins 0)) :win
           (zero? (get-counts board " ")) :draw 
           :else :ongoing
           )))))
  
