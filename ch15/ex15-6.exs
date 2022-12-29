# 15.4 병렬 맵 - 얼랭의 "Hello, World"

c("pmap.exs")
# [Parallel]
Parallel.pmap 1..10, &(&1 * &1)
# [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]



defmodule Parallel do
  def pmap(collection, fun) do
    me = self()
    collection
    |> Enum.map(fn (elem) ->
      spawn_link fn -> (send me, { self(), fun.(elem) }) end
    end)
    |> Enum.map(fn (pid) ->
      receive do { _pid, result } -> result end      # BUG: ^pid대신 _pid 사용시 순서 보장 안됨
    end)
  end
end
