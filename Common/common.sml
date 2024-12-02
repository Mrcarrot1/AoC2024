structure AoCCommon : AOC_COMMON =
struct
  open TextIO

  fun lines stream =
    let
      fun loop NONE acc _ = acc
        | loop (SOME line) acc file =
            loop (inputLine file) (line::acc) file
    in
      loop (inputLine stream) nil stream
    end

  fun readAllLines file =
    let
      val fstream = openIn file
      val output = lines fstream
      val _ = closeIn fstream
    in
      output
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
end
