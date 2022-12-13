# 10.1.1 정렬에 관한 팁

Enum.sort ["there", "was", "a", "crooked", "man"],
  &(String.length(&1) <= String.length(&2))
# ["a", "was", "man", "there", "crooked"]


defmodule Exercise do
  def all?(list, predicate) do
    list == filter(list, predicate)
  end

  def each([], _func), do: :ok
  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  def filter([], _predicate), do: []
  def filter([head | tail], predicate) do
    if predicate.(head) do
      [head | filter(tail, predicate)]
    else
      filter(tail, predicate)
    end
  end

  def split(list, len) do
    {take(list, len), drop(list, len)}
  end

  def take([], _len), do: []
  def take([head | tail], len) when len > 0 do
    [head | take(tail, len - 1)]
  end
  def take(_list, _len), do: []

  def drop([], _len), do: []
  def drop([head | tail], len) when len > 0 do
    drop(tail, len - 1)
  end
  def drop(list, _len), do: list
end


defmodule MyList do
  def flatten([]), do: []
  def flatten([[head | tail] | rest]) do
    flatten([head | flatten(tail)] ++ rest)
  end
  def flatten([head | tail]) do
    [head | flatten(tail)]
  end
end

MyList.flatten([1, [2, 3, [4]], 5, [[[6]]]])



defmodule MyList do
  def flatten(list), do: _flatten(list, [])

  defp _flatten([], result), do: Enum.reverse result

  defp _flatten([[head] | rest], result) do
    _flatten([head | rest], result)
  end

  defp _flatten([[head | tail] | rest], result) do
    _flatten([tail | rest], [head | result])
  end
  
  defp _flatten([head | tail], result) do
    _flatten(tail, [head | result])
  end
end

MyList.flatten([1, [2, 3, [4]], 5, [[[6]]]])
