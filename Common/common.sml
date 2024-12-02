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
end
