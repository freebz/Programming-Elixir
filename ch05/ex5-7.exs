# 5.4 함수를 인자로 전달하기

times_2 = fn n -> n * 2 end
# #Function<44.65746770/1 in :erl_eval.expr/5>
apply = fn (fun, value) -> fun.(value) end
# #Function<43.65746770/2 in :erl_eval.expr/5>
apply.(times_2, 6)
# 12


list = [1, 3, 5, 7, 9]
# [1, 3, 5, 7, 9]
Enum.map list, fn elem -> elem * 2 end
# [2, 6, 10, 14, 18]
Enum.map list, fn elem -> elem * elem end
# [1, 9, 25, 49, 81]
Enum.map list, fn elem -> elem > 6 end
# [false, false, false, true, true]
