let score (x: float) (y: float): int =
  let r : float =sqrt(x *. x +. y *. y) in
  match r with
    | r when r <= 1.0 -> 10
    | r when r <= 5. -> 5
    | r when r <= 10. -> 1
    | _ -> 0 
