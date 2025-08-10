(ns secret-handshake)

(def dict {0 "wink", 1 "double blink", 2 "close your eyes", 3 "jump"})

(defn commands [code] 
  (let [cmd-lst 
    (keep not-empty (for [i (range 0 4)]
                           (if (bit-test code i) (dict i) () )
                     ))]
    (if (bit-test code 4) (vec (reverse cmd-lst)) (vec cmd-lst))
    )
)
