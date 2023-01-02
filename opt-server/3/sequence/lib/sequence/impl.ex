# 코드: opt-server/3/sequence/lib/sequence/impl.ex

defmodule Sequence.Impl do
  def next(number),             do: number + 1
  def increment(number, delta), do: number + delta
end
