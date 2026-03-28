namespace ArmstrongNumbers

private def toDigit (ch: Char) : Nat :=
  (Char.toNat ch - Char.toNat '0')

def isArmstrongNumber (number : Nat) : Bool :=
  let digits := (Nat.toDigits 10 number |> List.map (fun c => (toDigit c)))
  let length := List.length digits
  number == (digits |> List.map (fun d => ( d^length)) |> List.sum) 

end ArmstrongNumbers
