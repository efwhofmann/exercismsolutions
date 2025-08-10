(ns pig-latin)


(defn consonant-ptn [word ptn]
  (let [ms (re-matches ptn word)]
     (if (some? ms)
       (clojure.string/join "" [(nth ms 2) (nth ms 1) "ay"])
       nil)))
 
(defn vowels [word]
 (if (some? (re-find #"^([aeiou]|yt|xr)(\w*)" word)) 
    (clojure.string/join "" [word "ay"]) 
     nil))

(defn translate-word [word] 
  (let [vs (vowels word) 
        c1 (consonant-ptn word #"^([^aeiou]*qu)(\w*)") 
        c2 (consonant-ptn word #"^([^aeiou]+)(y\w*)")
        c3 (consonant-ptn word #"^([^aeiou]+)(\w*)")] 
      (if (some? vs) vs 
        (if (some? c1) c1 
          (if (some? c2) c2
            (if (some? c3) c3 word))))))
     

(defn translate [phrase]
  (clojure.string/replace phrase #"\w+" #(translate-word %1)))