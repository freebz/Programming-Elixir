# 7.6.1 리스트의 리스트

c "weather.exs"
# [WeatherHistory]
import WeatherHistory
# WeatherHistory
for_location_27(test_data)
# [
#   [1366225622, 27, 15, 0.45],
#   [1366229222, 27, 17, 0.468],
#   [1366232822, 27, 21, 0.05]
# ]


defmodule MyList do
  def span(from, to, acc) when from > to, do: acc
  def span(from, to, acc) do
    span(from, to - 1, [to | acc])
  end
  
  def span(from, to) do
    span(from, to, [])
  end
end
