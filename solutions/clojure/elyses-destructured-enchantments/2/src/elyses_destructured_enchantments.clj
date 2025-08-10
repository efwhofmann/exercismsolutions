(ns elyses-destructured-enchantments)

(defn first-card
  "Returns the first card from deck."
  [deck]
  (let [[cardone] deck]
    cardone)
)

(defn second-card
  "Returns the second card from deck."
  [deck]
  (let [[_ cardtwo] deck]
    cardtwo
    )
)

(defn swap-top-two-cards
  "Returns the deck with first two items reversed."
  [deck]
  (let [[c_one c_two & c_rest] deck]
    (conj c_rest c_one c_two)
    )
)

(defn discard-top-card
  "Returns a sequence containing the first card and
   a sequence of the remaining cards in the deck."
  [deck]
  (let [[f & r] deck] 
    (list f r))
)

(def face-cards
  ["jack" "queen" "king"])

(defn insert-face-cards
  "Returns the deck with face cards between its head and tail."
  [deck]
  (let [[fst & r] deck [& faces] face-cards]
    (remove nil? (concat (conj faces fst) r))
    )
)
