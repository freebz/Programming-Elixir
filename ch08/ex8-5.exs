# 8.5 맵 수정하기

m = %{ a: 1, b: 2, c: 3 }
# %{a: 1, b: 2, c: 3}
m1 = %{ m | b: "two", c: "three" }
# %{a: 1, b: "two", c: "three"}
m2 = %{ m1 | a: "one" }
# %{a: "one", b: "two", c: "three"}
