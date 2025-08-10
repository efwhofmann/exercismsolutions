(ns bank-account)

(defn open-account [] ;; <- arglist goes here
  ;; your code goes here
  (atom 0))

(defn close-account [account] ;; <- arglist goes here
  ;; your code goes here
  (reset! account nil)
  )

(defn get-balance [account] ;; <- arglist goes here
  ;; your code goes here
  @account  )

(defn update-balance [account value] ;; <- arglist goes here
  ;; your code goes here
  (swap! account #(+ % value))
  )


