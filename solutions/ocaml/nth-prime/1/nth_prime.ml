let has_divisor_in_lst n lst = 
  List.mem true (List.map (fun k -> n mod k = 0) lst)

let nth_prime num = 
  if num<=0 then 
    Error("there is no zeroth prime")
  else
    let rec nth cand primes = 
      if List.length primes >= num then (cand - 2) 
      else if has_divisor_in_lst cand primes then nth (cand + 2) primes
      else nth (cand + 2) (cand :: primes)
    in    
    if num=1 then Ok 2
    else if num=2 then Ok 3
    else
      Ok (nth 5 [2 ; 3])
    