open Base

let collatz_conjecture n = 
  let rec aux n steps =
    match n with
      | 1 -> Ok steps
      | _ -> match (n % 2) with
            | 0 -> aux (n/2) (steps+1)
            | _ -> aux (3*n +1) (steps +1)
  in 
  if n<=0  then 
       Error "Only positive integers are allowed"
  else aux n 0
