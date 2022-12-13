# 10.3 Collectable 프로토콜

Enum.into 1..5, []
# [1, 2, 3, 4, 5]


Enum.into 1..5, [ 100, 101 ]
# [100, 101, 1, 2, 3, 4, 5]


Enum.into IO.stream(:stdio, :line), IO.stream(:stdio, :line)
