namespace CollatzConjecture

def Positive := { x : Nat // 0 < x }

def steps (n : Positive) : Nat :=  Id.run 
do
  let mut num:= n.val
  let mut count:=0
  
  while Ne num 1 do
    if num%2 == 0 then num:=num/2
    else num:=3*num+1
    count:= count+1

  return count
  
end CollatzConjecture
