namespace ArmstrongNumbers

private def toDigit (ch: Char) : Nat :=
  (ch.toNat - '0'.toNat)

def isArmstrongNumber (number : Nat) : Bool :=
  let digits := (Nat.toDigits 10 number |> List.map (fun c => (toDigit c)))
  let length := List.length digits
  (digits |> List.map (fun d => ( d^length)) |> List.sum) == number

end ArmstrongNumbers
