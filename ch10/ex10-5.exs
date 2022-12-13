# 10.2.3 직접 스트림 만들기

Stream.cycle(~w{ green white }) |>
  Stream.zip(1..5) |>
  Enum.map(fn {class, value} ->
    "<tr class='#{class}'><td>#{value}</td></tr>\n" end) |>
  IO.puts
# <tr class='green'><td>1</td></tr>
# <tr class='white'><td>2</td></tr>
# <tr class='green'><td>3</td></tr>
# <tr class='white'><td>4</td></tr>
# <tr class='green'><td>5</td></tr>
# :ok


Stream.repeatedly(fn -> true end) |> Enum.take(3)
# [true, true, true]
Stream.repeatedly(&:random.uniform/0) |> Enum.take(3)
# [0.7230402056221108, 0.94581636451987, 0.5014907142064751]


Stream.iterate(0, &(&1+1)) |> Enum.take(5)
# [0, 1, 2, 3, 4]
Stream.iterate(2, &(&1*&1)) |> Enum.take(5)
# [2, 4, 16, 256, 65536]
Stream.iterate([], &[&1]) |> Enum.take(5)
# [[], [[]], [[[]]], [[[[]]]], [[[[[]]]]]]


Stream.unfold({0, 1}, fn {f1, f2} -> {f1, {f2, f1+f2}} end) |> Enum.take(15)
# [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377]


Stream.resource(fn -> File.open!("sample") end,
  fn file ->
    case IO.read(file, :line) do
      data when is_binary(data) -> {[data], file}
      _ -> {:halt, file}
    end
  end
  fn file -> File.close(file) end)



c "countdown.exs"
# [Countdown]

counter = Countdown.timer
# #Function<51.58486609/2 in Stream.resource/3>

printer = counter |> Stream.each(&IO.puts/1)
# #Stream<[enum: #Function<51.58486609/2 in Stream.resource/3>,
#  funs: [#Function<38.58486609/1 in Stream.each/2>] ]>


speaker = printer |> Stream.each(&Countdown.say/1)
# #Stream<[enum: #Function<51.58486609/2 in Stream.resource/3>,
#  funs: [#Function<38.58486609/1 in Stream.each/2>,
#   #Function<38.58486609/1 in Stream.each/2>] ]>


speaker |> Enum.take(5)
# 10     ** 숫자가 1초에 하나씩 출력된다.
# 9      ** 게다가 컴퓨터가 출력되는 숫자를 소리내어 읽어준다.
# 8
# 7
# 6
# ["10", "9", "8", "7", "6"]


speaker |> Enum.take(3)
# 30
# 29
# 28
# ["30", "29", "28"]


speaker |> Enum.to_list
# 6
# 5
# 4
# 3
# 2
# 1
# ["6", "5", "4", "3", "2", "1"]
