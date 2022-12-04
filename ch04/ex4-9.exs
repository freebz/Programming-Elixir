# 4.9.2 with 표현식

with [a | _] <- [1, 2, 3], do: a
# 1
with [a | _] <- nil, do: a
# nil
