# 10.1 Enum: 컬렉션 처리하기

# 다른 컬렉션을 리스트로 바꾸기
list = Enum.to_list 1..5
# [1, 2, 3, 4, 5]


# 컬렉션 연결하기
Enum.concat([1,2,3], [4,5,6])
# [1, 2, 3, 4, 5, 6]
Enum.concat [1,2,3], 'abc'
# [1, 2, 3, 97, 98, 99]


# 기존 컬렉션의 각 값에 함수를 적용해 새 컬렉션 만들기
Enum.map(list, &(&1 * 10))
# [10, 20, 30, 40, 50]
Enum.map(list, &String.duplicate("*", &1))
# ["*", "**", "***", "****", "*****"]


# 위치 또는 조건으로 값을 선택하기
Enum.at(10..20, 3)
# 13
Enum.at(10..20, 20)
# nil
Enum.at(10..20, 20, :no_one_here)
# :no_one_here
Enum.filter(list, &(&1 > 2))
# [3, 4, 5]
require Integer     # is_even을 사용하기 위해 호출
# Integer
Enum.filter(list, &Integer.is_even/1)
# [2, 4]
Enum.reject(list, &Integer.is_even/1)
# [1, 3, 5]


# 값 정렬, 비교하기
Enum.sort ["three", "was", "a", "crooked", "man"]
# ["a", "crooked", "man", "three", "was"]
Enum.sort ["three", "was", "a", "crooked", "man"],
  &(String.length(&1) <= String.length(&2))
# ["a", "was", "man", "three", "crooked"]
Enum.max ["three", "was", "a", "crooked", "man"]
# "was"
Enum.max_by ["three", "was", "a", "crooked", "man"], &String.length/1
# "crooked"


# 컬렉션 나누기
Enum.take(list, 3)
# [1, 2, 3]
Enum.take_every list, 2
# [1, 3, 5]
Enum.take_while(list, &(&1 < 4))
# [1, 2, 3]
Enum.split(list, 3)
# {[1, 2, 3], [4, 5]}
Enum.split_while(list, &(&1 < 4))
# {[1, 2, 3], [4, 5]}


# 컬렉션의 값을 합쳐 문자열로 만들기
Enum.join(list)
# "12345"
Enum.join(list, ", ")
# "1, 2, 3, 4, 5"


# 명제
Enum.all?(list, &(&1 < 4))
# false
Enum.any?(list, &(&1 < 4))
# true
Enum.member?(list, 4)
# true
Enum.empty?(list)
# false


# 컬렉션 합치기
Enum.zip(list, [:a, :b, :c])
# [{1, :a}, {2, :b}, {3, :c}]
Enum.with_index(["once", "upon", "a", "time"])
# [{"once", 0}, {"upon", 1}, {"a", 2}, {"time", 3}]


# 각 항목을 합쳐 하나의 값으로 만들기
Enum.reduce(1..100, &(&1+&2))
# 5050
Enum.reduce(["now", "is", "the", "time"], fn word, longest ->
  if String.length(word) > String.length(longest) do
    word
  else
    longest
  end
end)
# "time"
Enum.reduce(["now", "is", "the", "time"], 0, fn word, longest ->
  if    String.length(word) > longest,
  do:   String.length(word),
  else: longest
end)
# 4


# 트럼프 카드 다루기
import Enum
deck = for rank <- '23456789TJQKA', suit <- 'CDHS', do: [suit,rank]
# ['C2', 'D2', 'H2', 'S2', 'C3', 'D3', ... ]
deck |> shuffle |> take(13)
# ['D9', 'C7', 'CJ', 'D2', 'H6', 'H5', 'S2', 'H3', 'C8', 'C6', 'ST', 'DA', 'CQ']
hands = deck |> shuffle |> chunk_every(13)
# [['SQ', 'CA', 'DK', 'HJ', 'D4', 'S3', 'HT', 'SA', 'H7', 'D2', 'S9', 'H4', 'S8'],
#  ['H3', 'CT', 'D7', 'CJ', 'S5', 'S7', 'HQ', 'C4', 'C6', 'D5', 'H2', 'HK', 'S6'],
#  ['D8', 'D3', 'CK', 'DQ', 'D9', 'C8', 'D6', 'C5', 'SJ', 'ST', 'HA', 'DJ', 'DA'],
#  ['H8', 'C3', 'C7', 'H6', 'S2', 'C9', 'H5', 'SK', 'DT', 'H9', 'C2', 'CQ', 'S4']]
