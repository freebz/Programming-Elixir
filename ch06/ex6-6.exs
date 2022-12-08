# 6.5 기본 파라미터

defmodule Chop do
  def guess(actual, a..b) do
    guess(actual, a..b, div(a + b, 2))
  end
  
  def guess(actual, a..b, expected) when actual < expected do
    IO.puts "Is it #{expected}"
    guess(actual, a..expected)
  end

  def guess(actual, a..b, expected) when actual > expected do
    IO.puts "Is it #{expected}"
    guess(actual, expected..b)
  end

  def guess(actual, range, expected) do
    IO.puts "Is it #{expected}"
    IO.puts actual   
  end
end
