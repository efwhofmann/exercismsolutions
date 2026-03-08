namespace Raindrops

def convert (number : Nat) : String :=   
  let make_sound := fun (number : Nat)(d : Nat)(s : String) =>
    if d∣number then s else ""
  let sounds := [make_sound number 3 "Pling",
   make_sound number 5 "Plang",  
   make_sound number 7 "Plong"]
  let sound := String.join sounds
  if sound=="" then toString number
  else sound
 
end Raindrops
