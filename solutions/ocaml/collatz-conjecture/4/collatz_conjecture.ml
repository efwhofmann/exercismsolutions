open Base

let collatz_conjecture n = 
  let rec aux n steps =
    match n with
      | 1 -> Ok steps
      | _ -> let next_n = if (n % 2)=0 then n/2 else 3*n+1
              in
                aux next_n (steps + 1)
  in 
  if n<=0  then 
       Error "Only positive integers are allowed"
  else aux n 0
