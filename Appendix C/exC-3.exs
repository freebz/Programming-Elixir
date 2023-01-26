# C.6 파이프라이닝 강화 (1.12)

@spec concat_and_uniq_list(list(), list()) :: list()
def concat_and_uniq_list(list1, list2) do
  list1
  |> Kernel.++(list2)
  |> Enum.uniq()
end


@spec concat_and_uniq_list(list(), list()) :: list()
def concat_and_uniq_list(list1, list2) do
  IO.inspect(length(list1), label: "처리 전")
  list = list1 ++ list2
  IO.inspect(length(list), label: "처리 중")
  list = Enum.uniq(list)
  IO.inspect(length(list), label: "처리 후")
  list
end


@spec concat_and_uniq_list(list(), list()) :: list()
def concat_and_uniq_list(list1, list2) do
  list1
  |> tap(&IO.inspect(length(&1), label: "처리 전"))
  |> Kernel.++(list2)
  |> tap(&IO.inspect(length(&1), label: "처리 중"))
  |> Enum.uniq()
  |> tap(&IO.inspect(length(&1), label: "처리 후"))
end


@spec concat_and_uniq_list(list(), list()) :: list()
def concat_and_uniq_list(list1, list2) do
  result =
    list1
    |> Kernel.++(list2)
    |> Enum.uniq()

  if length(result) |> Integer.is_even() do
    result
  else
    result ++ [0]
  end
end


@spec concat_and_uniq_list(list(), list()) :: list()
def concat_and_uniq_list(list1, list2) do
  list1
  |> Kernel.++(list2)
  |> Enum.uniq()
  |> then(fn result ->
    if length(result) |> Integer.is_even(), do: result, else: result ++ [0]
  end)
end
