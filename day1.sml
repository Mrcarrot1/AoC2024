structure Day1 : AOC_DAY =
struct
  open AoCCommon
  open Operators
  infix 8 |>

  exception Format
      
  fun lineTuple line =
    let
      val ints = 
        String.tokens Char.isSpace line
          |> map Int.fromString
          |> List.filter (fn (SOME _) => true | NONE => false)
          |> map (fn (SOME x) => x | NONE => 0)
    in
      case length ints of
          2 => (List.nth (ints, 0), List.nth (ints, 1))
        | _ => raise Format
    end

  fun lineTuples lines = 
    lines |> map lineTuple

  fun unzip lst =
    let
      fun loop nil acc1 acc2 = (acc1, acc2)
        | loop (x::xs) acc1 acc2 = 
          let
            val (a, b) = x
          in
            loop xs (a::acc1) (b::acc2)
          end
    in
      loop lst nil nil
    end

  fun mapTuple2 f x =
    let
      val (a, b) = x
    in
      (f a, f b)
    end

  exception UnequalSizes
  fun zip f (l1, l2) =
    let
      fun loop nil nil acc = acc
        | loop (x::xs) (y::ys) acc = loop xs ys ((f (x, y))::acc)
        | loop _ _ _ = raise UnequalSizes
    in
      loop l1 l2 nil
    end

  fun part1 file =
      SOME
        (readAllLines file
          |> lineTuples
          |> unzip
          |> mapTuple2 (ListMergeSort.sort op >)
          |> zip op -
          |> map abs
          |> foldl op + 0
          |> Int.toString)

  fun part2 file =
    SOME
      (readAllLines file
        |> lineTuples
        |> unzip
        |> (fn (x, y) =>
            x |> map (fn xx =>
              xx * length (y |> List.filter (fn yy => yy = xx))))
        |> foldl op + 0
        |> Int.toString)
    
end
