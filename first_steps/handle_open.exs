# 코드: first_steps/handle_open.exs

handle_open = fn
  {:ok, file} -> "Read data: #{IO.read(file, :line)}"
  {_, error} -> "Error: #{:file.format_error(error)}"
end

IO.puts handle_open.(File.open("Rakefile"))    # 존재하는 파일을 연다.
IO.puts handle_open.(File.open("nonexistent")) # 존재하지 않는 파일을 연다.
