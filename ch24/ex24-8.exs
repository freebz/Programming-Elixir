# 24.6 프로토콜과 다형성

defmodule Exercise do

  def each(enumerable, fun) do
    Enum.reduce(enumerable, :ok, fn x, acc ->
      fun.(x)
      acc
    end)
  end

  def filter(enumerable, fun) do
    Enum.reduce(enumerable, [], fn x, acc ->
      if fun.(x) do
	[x | acc]
      else
	acc
      end
    end)
    |> Enum.reverse
  end

  def map(enumerable, fun) do
    Enum.reduce(enumerable, [], fn x, acc ->
      [fun.(x) | acc]
    end)
    |> Enum.reverse
  end

  def inspect(term, opts \\ []) do
    {result, binding} = Code.eval_string Kernel.inspect(term, opts)
    result
  end
end


Exercise.each(["some", "example"], fn x -> IO.puts(x) end)
# "some"
# "example"
#=> :ok

Exercise.filter([1, 2, 3], fn x -> rem(x, 2) == 0 end)
# [2]

Exercise.map([1, 2, 3], fn x -> x * 2 end)
# [2, 4, 6]

Exercise.map([a: 1, b: 2], fn {k, v} -> {k, -v} end)
# [a: -1, b: -2]


defmodule Blob do
  defstruct content: nil
end

b = %Blob{content: 123}
inspect b
Exercise.inspect b
# %Blob{content: 123}

Exercise.inspect(:foo)
# :foo

Exercise.inspect([1, 2, 3, 4, 5])
# [1, 2, 3, 4, 5]

Exercise.inspect("olá" <> <<0>>)
# <<111, 108, 195, 161, 0>>

