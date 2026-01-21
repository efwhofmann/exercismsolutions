open Base

let collatz_conjecture num = 
  let rec aux num steps =
    if num<=0 then 
      Error "Only positive integers are allowed"
    else if num = 1 then 
      Ok steps
    else if (num % 2) = 0 then 
      aux (num/2) (steps + 1)
    else 
      aux (3 * num + 1) (steps + 1)
  in aux num 0