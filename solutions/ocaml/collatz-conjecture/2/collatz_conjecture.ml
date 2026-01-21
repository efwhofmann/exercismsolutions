open Base

let collatz_conjecture num = 
  let rec aux num steps =
    match num with
      | 1 -> Ok steps
      | n when n % 2 = 0 -> aux (n/2) (steps+1)
      | _ -> aux (3*num+1) (steps+1)
  in 
  if num<=0  then 
       Error "Only positive integers are allowed"
  else aux num 0
