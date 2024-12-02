signature OPERATORS =
sig
  val |> : 'a * ('a -> 'b) -> 'b
  val ||> : ('a * 'b) * ('a -> 'b -> 'c) -> 'c
  val |||> : ('a * 'b * 'c) * ('a -> 'b -> 'c -> 'd) -> 'd
  val <| : ('a -> 'b) * 'a -> 'b
  val <|| : ('a -> 'b -> 'c) * ('a * 'b) -> 'c
  val <||| : ('a -> 'b -> 'c -> 'd) * ('a * 'b * 'c) -> 'd
end
