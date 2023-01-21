# 22.9 엄청나게 더 깊이

quote do: 1 + 2
# {:+, [context: Elixir, import: Kernel], [1, 2]}


Code.eval_quoted {:+, [], [1,2]}
# {3, []}
