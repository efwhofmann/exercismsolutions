let classify n = 
  let rec aliquot m sum = 
    if m>n/2 then sum
    else if n mod m = 0 then aliquot (m+1) (sum+m)
    else aliquot (m+1) sum
  in 
  if n<=0 then
    Error "Classification is only possible for positive integers."
  else if n==1 then Ok "deficient"
  else 
    let a = aliquot 1 0
    in 
      if a=n then Ok "perfect"
      else if a<n then Ok "deficient"
      else Ok "abundant"
    
      
    