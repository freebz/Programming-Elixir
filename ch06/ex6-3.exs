# 6.3 함수 호출과 패턴 매칭

c "factorial1.exs"
# [Factorial]
Factorial.of(3)
# 6
Factorial.of(7)
# 5040
Factorial.of(10)
# 3628800
Factorial.of(1000)
# 4023872600770937735437024339230039857193748642107146325437999104299385123986290205
# 9204420848696940480047998861019719605863166687299480855890132382966994459099742450
# 4087073759918823627727188732519779505950995276120874975462497043601418278094646496
# ...
# 6372524230560855903700624271243416909004153690105933983835777939410970027753472000
# 0000000000000000000000000000000000000000000000000000000000000000000000000000000000
# 0000000000000000000000000000000000000000000000000000000000000000000000000000000000
# 0000000000000000000000000000000000000000000000000000000000000000000000000000000000


c "factorial1-bad.exs"
# warning: this clause for of/1 cannot match because a previous clause at line 4 always matches
#   factorial1-bad.exs:5

# [BadFactorial]



defmodule Sum do
  def sum(0), do: 0
  def sum(n), do: n + sum(n-1)
end


defmodule Gcd do
  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x, y))
end
