# 23.3 종합: 메서드 호출 추적하기

c("tracer.ex")
# ** (UndefinedFunctionError) function Test.puts_sum_three/3 is undefined or private


c("tracer1.ex")
# {:puts_sum_three, [line: 14],
#  [{:a, [line: 14], nil}, {:b, [line: 14], nil}, {:c, [line: 14], nil}]}
# {:add_list, [line: 15], [{:list, [line: 15], nil}]}
# ** (UndefinedFunctionError) function Test.puts_sum_three/3 is undefined or private


c("tracer2.ex")
# 6


c("tracer3.ex")
# ==> call: puts_sum_three(1, 2, 3)
# 6
# <== result: 6
# ==> call: add_list([5, 6, 7, 8])
# <== result: 26


c("tracer4.ex")
# ==> call: puts_sum_three(1, 2, 3)
# 6
# <== result: 6
# ==> call: add_list([5, 6, 7, 8])
# <== result: 26
