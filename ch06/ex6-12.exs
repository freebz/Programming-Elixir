# 6.10 모듈의 이름: 엘릭서, 얼랭, 아톰

is_atom IO
# true
to_string IO
# "Elixir.IO"
:"Elixir.IO" === IO
# true


IO.puts 123
# 123
# :ok
:"Elixir.IO".puts 123
# 123
# :ok


my_io = IO
# IO
my_io.puts 123
# 123
# :ok
