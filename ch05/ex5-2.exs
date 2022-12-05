# 5.1 함수와 패턴 매칭

swap = fn { a, b } -> { b, a } end
# #Function<44.65746770/1 in :erl_eval.expr/5>
swap.( { 6, 8 } )
# {8, 6}


list_concat = fn (a, b) -> a ++ b end
list_concat.([:a, :b], [:c, :d])
# => [:a, :b, :c, :d]

sum = fn (a, b, c) -> a + b + c end
sum.(1, 2, 3)
# => 6

pair_tuple_to_list = fn { a, b } -> [ a, b ] end
pair_tuple_to_list.( { 1234, 5677 } )
# => [1234, 5677]
