# 코드: lists/weather3.exs

defmodule WeatherHistory do
  def for_location([], _target_loc), do: []
  def for_location([ head = [_, target_loc, _, _ ] | tail], target_loc) do
    [ head | for_location(tail, target_loc) ]
  end
  def for_location([ _ | tail], target_loc), do: for_location(tail, target_loc)
end
