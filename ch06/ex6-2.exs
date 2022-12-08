# 6.2 함수의 본문은 블록이다

def double(n), do: n * 2


def greet(greeting, name), do: (
  IO.puts greeting
  IO.puts "How're you doing, #{name}?"
)


defmodule Times, do: (def double(n), do: n*2)


defmodule Times do
  def double(n), do: n * 2
  def triple(n), do: n * 3
  def quadruple(n), do: double(double(n))
end
