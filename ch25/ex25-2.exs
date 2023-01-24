# 25.1.1 옵션 선택하기

c("../odds/color.exs")
# 16711680
# {0, 100, 100}


defmodule Exercise do
  def sigil_v(lines, _opts) do
    lines
    |> String.split("\n")
    |> Enum.map(&String.trim/1)
    |> Enum.filter(fn line -> line != "" end)
    |> Enum.map(fn line ->
      line |> String.split ","
    end)
  end
end

import Exercise

csv = ~v"""
1,2,3
cat,dog
"""
# [["1", "2", "3"], ["cat", "dog"]]


defmodule Exercise do
  def sigil_v(lines, _opts) do
    lines
    |> String.split("\n")
    |> Enum.map(&String.trim/1)
    |> Enum.filter(fn line -> line != "" end)
    |> Enum.map(fn line ->
      line
      |> String.split(",")
      |> Enum.map(fn csv ->
	case Float.parse csv do
	  {value, _rest} -> value
	  :error         -> csv
	end
      end)
    end)
  end
end

import Exercise

csv = ~v"""
1,2,3.14
cat,dog
"""
# [[1.0, 2.0, 3.14], ["cat", "dog"]]


defmodule Exercise do
  def sigil_v(lines, _opts) do
    [head | tail] = lines
    |> String.split("\n")
    |> Enum.map(&String.trim/1)
    |> Enum.filter(fn line -> line != "" end)
    |> Enum.map(fn line ->
      line
      |> String.split(",")
      |> Enum.map(fn csv ->
	case Float.parse csv do
	  {value, _rest} -> value
	  :error         -> csv
	end
      end)
    end)
    head = Enum.map(head, fn h -> String.to_atom(h) end)
    tail
    |> Enum.map(fn item ->
      Enum.zip(head, item)
    end)
  end
end

import Exercise

csv = ~v"""
Item,Qty,Price
Teddy bear,4,34.95
Milk,1,2.99
Battery,6,8.00
"""
# [
#   [Item: "Teddy bear", Qty: 4.0, Price: 34.95],
#   [Item: "Milk", Qty: 1.0, Price: 2.99],
#   [Item: "Battery", Qty: 6.0, Price: 8.0]
# ]
