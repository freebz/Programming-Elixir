# 6.4.1 가드 조건절에 사용할 수 있는 것들

defmodule Factorial do
  def of(0), do: 1
  def of(n) do
    if n < 0 do
      raise "factorial called on a negative number"
    else
      n * of(n-1)
    end
  end
end
