# 코드: mm/factorial1-bad.exs

defmodule BadFactorial do
  def of(n), do: n * of(n-1)
  def of(0), do: 1
end
