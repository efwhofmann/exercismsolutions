(ns bank-account)

(defn open-account [] ;; <- arglist goes here
  ;; your code goes here
  (ref {:balance 0})
  )

(defn close-account [account] ;; <- arglist goes here
  ;; your code goes here
  (dosync (ref-set account {}))
  )

(defn get-balance [account] ;; <- arglist goes here
  ;; your code goes here
  (@account :balance)
  )

(defn update-balance [account value] ;; <- arglist goes here
  ;; your code goes here
  (dosync
    (let [new-balance (+ (@account :balance) value)] (alter account assoc :balance new-balance))   )
  )


