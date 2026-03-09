namespace TwoFer

def twoFer (name : Option String) : String := Id.run do
  match name with 
    | some str => return "One for " ++ str ++ ", one for me."
    | none => return "One for you, one for me."    

end TwoFer
