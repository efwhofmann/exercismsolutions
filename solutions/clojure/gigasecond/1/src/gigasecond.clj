(ns gigasecond)

(def giga 1000000000)

(defn from [year month day] 
 (let [date (.plusSeconds(.atStartOfDay       (java.time.LocalDate/of year month day)) giga)] 
     [(.getYear date) 
        (.getMonthValue date) (.getDayOfMonth date)]
   )  
)
