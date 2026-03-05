namespace Leap

def leapYear (year : UInt16) : Bool :=
  let y := year.toNat
  (16 ∣ y) ∨ ((4 ∣ y) ∧ not (25 ∣ y)) 

end Leap
