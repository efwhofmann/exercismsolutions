namespace Raindrops

def convert (number : Nat) : String :=   
  let make_sound := fun (d : Nat)(s : String) =>
    if d∣number then s else ""
  let sounds := [make_sound 3 "Pling",
   make_sound 5 "Plang",  
   make_sound 7 "Plong"]
  let sound := String.join sounds
  if sound=="" then toString number
  else sound
 
end Raindrops
