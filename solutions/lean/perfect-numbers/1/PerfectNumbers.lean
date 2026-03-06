namespace PerfectNumbers

def Positive := { x : Nat // x > 0 }

inductive Classification where
  | perfect | abundant | deficient
  deriving BEq, Repr

def aliquot (num: Nat) : Nat := Id.run do
  if num=1 then 
    return 0
    
  let mut sum:=0
  let mut k:=1
  
  while k<=num/2 do
    if k ∣ num then sum:=sum+k
      k := k+1
      
  return sum  

def classify (number : Positive) : Classification := Id.run 
  do
    let a_sum := aliquot number.val
    if a_sum = number.val then 
      return .perfect
    else if a_sum > number.val then
      return .abundant
    else 
      return .deficient

end PerfectNumbers
