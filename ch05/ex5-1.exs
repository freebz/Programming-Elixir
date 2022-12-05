# 5장 익명 함수

sum = fn (a, b) -> a + b end
# #Function<43.65746770/2 in :erl_eval.expr/5>
sum.(1, 2)
# 3


greet = fn -> IO.puts "Hello" end
# #Function<45.65746770/0 in :erl_eval.expr/5>
greet.()
# Hello
# :ok


f1 = fn a, b -> a * b end
# #Function<43.65746770/2 in :erl_eval.expr/5>
f1.(5, 6)
# 30
f2 = fn -> 99 end
# #Function<45.65746770/0 in :erl_eval.expr/5>
f2.()
# 99
