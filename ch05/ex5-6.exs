# 5.3.2 모든 함수가 파라미터를 가진 경우

add_n = fn n -> (fn other -> n + other end) end
# #Function<44.65746770/1 in :erl_eval.expr/5>
add_two = add_n.(2)
# #Function<44.65746770/1 in :erl_eval.expr/5>
add_five = add_n.(5)
# #Function<44.65746770/1 in :erl_eval.expr/5>
add_two.(3)
# 5
add_five.(7)
# 12


prefix = fn prefix -> fn name -> "#{prefix} #{name}" end end
mrs = prefix.("Mrs")
# #Function<44.65746770/1 in :erl_eval.expr/5>
mrs.("Smith")
# "Mrs Smith"
prefix.("Elixir").("Rocks")
# "Elixir Rocks"
