# 7.5 리스트를 줄여 하나의 값으로 만들기

c "reduce.exs"
# [MyList]
MyList.reduce([1,2,3,4,5], 0, &(&1 + &2))
# 15
MyList.reduce([1,2,3,4,5], 1, &(&1 * &2))
# 120



defmodule MyList do
  def map([], _func), do: []
  def map([ head | tail ], func), do: [ func.(head) | map(tail, func) ]
  
  def reduce([], value, _) do
    value
  end
  def reduce([head | tail], value, func) do
    reduce(tail, func.(head, value), func)
  end

  def mapsum(list, func) do
    reduce(map(list, func), 0, &(&1 + &2))
  end

  def max([]), do: nil
  def max([head | tail]) do
    reduce(tail, head, &(if &1 > &2 do &1 else &2 end))
  end

  def caesar(list, n) do
    map(list, &(rem(&1 + n - 97, 26) + 97))
  end
end


MyList.mapsum [1, 2, 3], &(&1 * &1)
# 14

MyList.caesar('ryvkve', 13)
# 'elixir'
