namespace TwoFer

def twoFer (name : Option String) : String := Id.run do
  let who := match name with 
    | some str => str
    | none => "you"
  "One for " ++ who ++ ", one for me."

end TwoFer
