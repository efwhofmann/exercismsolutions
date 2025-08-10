(ns card-games)

(defn rounds
  "Takes the current round number and returns 
   a `list` with that round and the _next two_."
  [n]
  (list n (inc n) (inc (inc n)))
  )

(defn concat-rounds 
  "Takes two lists and returns a single `list` 
   consisting of all the rounds in the first `list`, 
   followed by all the rounds in the second `list`"
  [l1 l2]
  (concat l1 l2)
  )

(defn contains-round? 
  "Takes a list of rounds played and a round number.
   Returns `true` if the round is in the list, `false` if not."
  [l n]
  (not= (some #(= n %) l) nil)
  )

(defn card-average
  "Returns the average value of a hand"
  [hand]
  (let [n (* (count hand) 1.0)] (/ (reduce + hand) n))
  )

(defn approx-average?
  "Returns `true` if average is equal to either one of:
  - Take the average of the _first_ and _last_ number in the hand.
  - Using the median (middle card) of the hand."
  [hand]
  (let [n (count hand) idx-mid-card (/ (dec n) 2) avg (card-average hand)]
    (or (== avg (/ (+ (first hand)(last hand)) 2.0)) (== avg (nth hand idx-mid-card)))
    )
  )

(defn average-even-odd?
  "Returns true if the average of the cards at even indexes 
   is the same as the average of the cards at odd indexes."
  [hand]
  (== (card-average (keep-indexed #(when (odd? %1) %2) hand))
      (card-average (keep-indexed #(when (even? %1) %2) hand))
      )
  )

(defn maybe-double-last
  "If) the last card is a Jack (11), doubles its value
   before returning the hand."
  [hand]
 (if  (= (last hand) 11) (conj  (vec (drop-last hand)) 22) hand) 
  )
