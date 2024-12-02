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
