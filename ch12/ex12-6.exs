# 12.6 더 적은 것들로 더 큰 효과를

defmodule FizzBuzz do

  def upto(n) when n > 0, do: 1..n |> Enum.map(&fizzbuzz/1)

  defp fizzbuzz(n) do
    case [n, rem(n, 3), rem(n, 5)] do
      [_, 0, 0] -> "FizzBuzz"
      [_, 0, _] -> "Fizz"
      [_, _, 0] -> "Buzz"
      [n, _, _] -> n
    end
  end
end


defmodule Exercise do
  def ok!({:ok, data}), do: data
  def ok!({_, error}), do: raise error
end

file = Exercise.ok!(File.open("somefile"))
