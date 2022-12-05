# 5.3.1 함수는 자신의 원래 환경을 기억한다

greeter = fn name -> (fn -> "Hello #{name}" end) end
# #Function<44.65746770/1 in :erl_eval.expr/5>
dave_greeter = greeter.("Dave")
# #Function<45.65746770/0 in :erl_eval.expr/5>
dave_greeter.()
# "Hello Dave"
