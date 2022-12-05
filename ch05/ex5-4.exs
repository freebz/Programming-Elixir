# 5.3 함수를 반환하는 함수

fun1 = fn -> fn -> "Hello" end end
# #Function<45.65746770/0 in :erl_eval.expr/5>
fun1.()
# #Function<45.65746770/0 in :erl_eval.expr/5>
fun1.().()
# "Hello"


fun1 = fn ->
          fn ->
 	     "Hello"
          end
       end


fun1 = fn -> (fn -> "Hello" end) end
# #Function<45.65746770/0 in :erl_eval.expr/5>
other = fun1.()
# #Function<45.65746770/0 in :erl_eval.expr/5>
other.()
# "Hello"
