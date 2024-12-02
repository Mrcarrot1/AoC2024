signature AOC_COMMON =
  sig
    val readAllLines : string -> string list
    val mapTuple2 : ('a -> 'b) -> ('a * 'a) -> ('b * 'b)
    val zip : ('a * 'b -> 'c) -> ('a list * 'b list) -> 'c list
    val unzip : ('a * 'b) list -> ('a list) * ('b list)
  end
