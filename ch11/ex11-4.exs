# 11.2 '문자열'이라는 이름

# 11.3 작은따옴표 문자열은 문자 코드의 리스트다

str = 'wombat'
# 'wombat'
is_list str
# true
length str
# 6
Enum.reverse str
# 'tabmow'


[ 67, 65, 84 ]
# 'CAT'


str = 'wombat'
# 'wombat'
:io.format "~w~n", [ str ]
# [119,111,109,98,97,116]
# :ok
List.to_tuple str
# {119, 111, 109, 98, 97, 116}
str ++ [0]
# [119, 111, 109, 98, 97, 116, 0]


'∂x/∂y'
# [8706, 120, 47, 8706, 121]


'pole' ++ 'vault'
# 'polevault'
'pole' -- 'vault'
# 'poe'
List.zip [ 'abc', '123' ]
# [{97, 49}, {98, 50}, {99, 51}]
[ head | tail ] = 'cat'
# 'cat'
head
# 99
tail
# 'at'
[ head | tail ]
# 'cat'


c("parse.exs")
# [Parse]
Parse.number('123')
# 123
Parse.number('-123')
# -123
Parse.number('+123')
# 123
Parse.number('+9')
# 9
Parse.number('+a')
# ** (RuntimeError) Invalid digit 'a'


defmodule Exercise do
  def printable?(word) do
    Enum.all?(word, &(&1 >= ?  && &1 <= ?~))
  end

  def anagram?(word1, word2) do
    Enum.reverse(word1) == word2
  end

  def calculate(str) do
    _calculate(
      Enum.chunk_by(
	Enum.filter(str, &(&1 != ?\s)),
	&(Enum.member?('+-*/', &1))
      )
    )
  end

  defp _calculate([x, '+', y]) do
    Parse.number(x) + Parse.number(y)
  end
  defp _calculate([x, '-', y]) do
    Parse.number(x) - Parse.number(y)
  end
  defp _calculate([x, '*', y]) do
    Parse.number(x) * Parse.number(y)
  end
  defp _calculate([x, '/', y]) do
    Parse.number(x) / Parse.number(y)
  end
end


[ 'cat' | 'dog' ]
# ['cat', 100, 111, 103]


Exercise.calculate('123 + 27') # => 150
Exercise.calculate('123 - 27') # => 96
Exercise.calculate('123 * 27') # => 3321
Exercise.calculate('123 / 27') # => 4.555555555555555
