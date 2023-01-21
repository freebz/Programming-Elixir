# 22.2.2 quote 함수

quote do: :atom
# :atom
quote do: 1
# 1
quote do: 1.0
# 1.0
quote do: [1,2,3]
# [1,2,3]
quote do: {1,2}
# {1,2}
quote do: [do: 1]
# [do: 1]
quote do: (a = 1; a + a)
# {:__block__, [],
#  [{:=, [], [{:a, [], Elixir}, 1]},
#   {:+, [context: Elixir, import: Kernel],
#    [{:a, [], Elixir}, {:a, [], Elixir}]}]}
quote do: [ do: 1 + 2, else: 3 + 4]
# [do: {:+, [context: Elixir, import: Kernel], [1, 2]},
#  else: {:+, [context: Elixir, import: Kernel], [3, 4]}]
