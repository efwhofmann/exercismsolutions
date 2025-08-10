(ns yacht)

(defn score-by-number[n dice]
  (* (reduce + (map #(if (== % n) 1 0) dice)) n))

(def count_x (fn [x dice] (count (filter #(== % x) dice))))

(defn yacht? [dice] 
  (let [y (first dice)] 
    (== (count_x y dice) 5) 
    ) )

(defn score-four-of-a-kind [dice]
    (let [a (first dice) b (get dice 1)]
      (if (>= (count_x a dice) 4) (* 4 a) 
        (if (== (count_x b dice) 4) (* 4 b)
          0)))
  )

(defn score-full-house [dice]
  (let [s_dice (sort dice)]
      (let [n1 (count_x (first s_dice) s_dice) 
            n2 (count_x (last s_dice) s_dice)]
          (if (or (and (== n1 2) (== n2 3)) (and (== n2 2) (== n1 3))  )                   (reduce + dice) 0) 
        ))
  )


(defn score [dice category]
  (condp = category
    "ones"  (score-by-number 1 dice)
    "twos"  (score-by-number 2 dice)
    "threes"  (score-by-number 3 dice)
    "fours"  (score-by-number 4 dice)
    "fives"  (score-by-number 5 dice)
    "sixes"  (score-by-number 6 dice)
    "full house" (score-full-house dice)
    "yacht" (if (yacht? dice) 50 0)
    "choice" (reduce + dice)
    "four of a kind" (score-four-of-a-kind dice)
    "little straight" (if (= (sort dice) [1 2 3 4 5]) 30 0)
    "big straight"    (if (= (sort dice) [2 3 4 5 6]) 30 0)
    )
  )
