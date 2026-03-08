namespace Raindrops

def convert (number : Nat) : String :=  
  let make_sound := fun (d,s) => 
      if d∣number then some s else none
  
  let sounds := [(3, "Pling"), (5, "Plang"), (7, "Plong")].filterMap make_sound
  let sound := String.join sounds
  if sound=="" then toString number
  else sound
 
end Raindrops
