# 5.4.2 & 표기법

add_one = &(&1 + 1)          # add_one = fn (n) -> n + 1 end와 같다.
# #Function<44.65746770/1 in :erl_eval.expr/5>
add_one.(44)
# 45
square = &(&1 * &1)
# #Function<44.65746770/1 in :erl_eval.expr/5>
square.(8)
# 64
speak = &(IO.puts(&1))
# &IO.puts/1
speak.("Hello")
# Hello
# :ok


rnd = &(Float.round(&1, &2))
# &Float.round/2
rnd = &(Float.round(&2, &1))
# #Function<43.65746770/2 in :erl_eval.expr/5>


divrem = &{ div(&1,&2), rem(&1,&2) }
# #Function<43.65746770/2 in :erl_eval.expr/5>
divrem.(13, 5)
# {2, 3}


s = &"bacon and #{&1}"
# #Function<44.65746770/1 in :erl_eval.expr/5>
s.("custard")
# "bacon and custard"

match_end = &~r/.*#{&1}$/
# #Function<44.65746770/1 in :erl_eval.expr/5>
"cat" =~ match_end.("t")
# true
"cat" =~ match_end.("!")
# false


l = &length/1
# &:erlang.length/1
l.([1,3,5,7])
# 4

len = &Enum.count/1
# &Enum.count/1
len.([1,2,3,4])
# 4

m = &Kernel.min/2  # Kernel.min/2은 얼랭의 :erlang.min/2의 별칭(alias)이다.
# &:erlang.min/2
m.(99,88)
# 88


Enum.map [1,2,3,4], &(&1 + 1)
# [2, 3, 4, 5]
Enum.map [1,2,3,4], &(&1 * &1)
# [1, 4, 9, 16]
Enum.map [1,2,3,4], &(&1 < 3)
# [true, true, false, false]


Enum.map [1,2,3,4], fn x -> x + 2 end
Enum.map [1,2,3,4], &(&1 + 2)

Enum.each [1,2,3,4], fn x -> IO.inspect x end
Enum.each [1,2,3,4], &IO.inspect/1
