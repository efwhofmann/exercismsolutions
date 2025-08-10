(ns coordinate-transformation)

(defn translate2d 
  "Returns a function making use of a closure to
   perform a repeatable 2d translation of a coordinate pair."
  [dx dy]
  (fn [x y] (vector (+ x dx) (+ y dy)))
  )

(defn scale2d 
  "Returns a function making use of a closure to
   perform a repeatable 2d scale of a coordinate pair."
  [sx sy]
  (fn [x y] (vector (* x sx) (* y sy) ))
  )

(defn compose-transform
  "Create a composition function that returns a function that 
   combines two functions to perform a repeatable transformation."
  [f g]
  (fn [x y] (let [vec (f x y)] (g (first vec) (last vec))))
  )

(defn memoize-transform
  "Returns a function that memoizes the last result.
   If the arguments are the same as the last call,
   the memoized result is returned."
  [f]
    (let [args (atom nil)
          res (atom nil)]
      (fn [& new-args]
        (if (= new-args @args)
          @res
          (do (reset! args new-args)
              (reset! res (apply f new-args))
            ))
        )
    )
)