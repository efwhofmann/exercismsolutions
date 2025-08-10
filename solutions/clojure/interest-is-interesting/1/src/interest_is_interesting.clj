(ns interest-is-interesting)

(defn interest-rate
  "TODO: add docstring"
  [balance]
  (cond 
    (< balance 0)  -3.213 
    (< balance 1000) 0.5 
    (< balance 5000) 1.621 
    (>= balance 5000) 2.475 
    )
  )

(defn annual-increment [balance]
    (let [factor (bigdec (/ (interest-rate balance) 100))]
      (* (if (neg? balance) (- balance) balance) factor)
      )
  )

(defn annual-balance-update
  "TODO: add docstring"
  [balance]
  (+ balance 
  (annual-increment balance)     )
)

(defn amount-to-donate
  "TODO: add docstring"
  [balance tax-free-percentage]
  (if (> balance 0) 
    (int (* balance 
       (* 2.0 (/ tax-free-percentage 100.0))))
    0)
  )