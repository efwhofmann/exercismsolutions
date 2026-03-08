namespace Raindrops

def convert (number : Nat) : String :=   
  let sounds := [if 3∣number then "Pling" else "",
   if 5∣number then "Plang" else "",  
   if 7∣number then "Plong" else ""]
  let sound := String.join sounds
  if sound=="" then toString number
  else sound
 
end Raindrops
