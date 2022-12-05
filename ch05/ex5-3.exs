# 5.2 함수는 하나, 본문은 여러 개

handle_open = fn
  {:ok, file}  -> "Read data: #{IO.read(file, :line)}"
  {_,   error} -> "Error: #{:file.format_error(error)}"
end
# #Function<44.65746770/1 in :erl_eval.expr/5>
handle_open.(File.open("code/intro/hello.exs"))  # 존재하는 파일
# "Read data: IO.puts \"Hello, World!\"\n"
handle_open.(File.open("nonexistent"))           # 존재하지 않는 파일
# "Error: no such file or directory"


fizz_buzz = fn
  (0, 0, _) -> "FizzBuzz"
  (0, _, _) -> "Fizz"
  (_, 0, _) -> "Buzz"
  (_, _, n) -> n
end

fizzbuzz = fn n -> fizz_buzz.(rem(n, 3), rem(n, 5), n) end
