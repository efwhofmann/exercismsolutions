(ns beer-song)

(defn bottles [num]
  (if (= num 1) " bottle "
    " bottles ")
  )

(defn verse
  "Returns the nth verse of the song."
  [num]
  (let [dnum (dec num)]
    (if (>= num 1) 
      (str num (bottles num) "of beer on the wall, " num (bottles num) "of beer.\n"
         "Take "  (if (> num 1) "one" "it") " down and pass it around, " (if (zero? dnum) "no more" (str dnum)) (bottles dnum) "of beer on the wall.\n" ) 
         (str "No more bottles of beer on the wall, no more bottles of beer.\n" "Go to the store and buy some more, 99 bottles of beer on the wall.\n")
      )))

(defn sing
  "Given a start and an optional end, returns all verses in this interval. If
  end is not given, the whole song from start is sung."
  ([start] (sing start 0))
  ([start end]
   (clojure.string/join "\n" (map verse (range start (dec end) -1)))
 ))  
  
