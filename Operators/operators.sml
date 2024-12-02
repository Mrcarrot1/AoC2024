structure Operators : OPERATORS =
struct
  infix 8 |>
  fun op |> (x, f) = f x

  infix 8 ||>
  fun op ||> ((x, y), f) = f x y

  infix 8 |||>
  fun op |||> ((x, y, z), f) = f x y z

  infixr 8 <|
  fun op <| (f, x) = f x

  infixr 8 <||
  fun op <|| (f, (x, y)) = f x y

  infixr 8 <|||
  fun op <||| (f, (x, y, z)) = f x y z
end
