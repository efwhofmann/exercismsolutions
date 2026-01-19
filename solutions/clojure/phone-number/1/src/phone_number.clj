(ns phone-number)

(defn valid? [str]
  (let [length (count str)]
  (if (and (<= length 11) (>= length 10))
    (if (and (== length 11) (not (= (first str) \1) ))
        false
        (if (or (< (Character/digit (nth str (- length 10)) 10) 2)
              (< (Character/digit (nth str (- length 7)) 10) 2))
          false
          true))
        false)))

(defn number [phone_no] 
  (let [clean (clojure.string/replace phone_no #"\D" "")]
    (if (valid? clean)
      (if (== (count clean) 11) 
        (subs clean 1 11)
        clean)
      "0000000000"))  )
