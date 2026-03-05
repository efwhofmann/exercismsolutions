namespace Darts

def score (x : Float) (y : Float) : Int :=
  let d := x^2 + y^2
  if d<=1.0 then 10
  else if d<=25 then 5
  else if d<=100 then 1
  else 0
end Darts
