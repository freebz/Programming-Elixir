# 22.6 코드 조각을 실행하는 다른 방법

fragment = quote do: IO.puts("hello")
# {{:., [], [{:__aliases__, [alias: false], [:IO]}, :puts]}, [], ["hello"]}
Code.eval_quoted fragment
# hello
# {:ok, []}


fragment = quote do: IO.puts(var!(a))
# {{:., [], [{:__aliases__, [alias: false], [:IO]}, :puts]}, [],
#  [{:var!, [context: Elixir, import: Kernel], [{:a, [], Elixir}]}]}
Code.eval_quoted fragment, [a: "cat"]
# cat
# {:ok, [a: "cat"]}


fragment = Code.string_to_quoted("defmodule A do b(c) do c+1 end end")
# {:ok,
#  {:defmodule, [line: 1],
#   [
#     {:__aliases__, [line: 1], [:A]},
#     [
#       do: {:b, [line: 1],
#        [{:c, [line: 1], nil}, [do: {:+, [line: 1], [{:c, [line: 1], nil}, 1]}]]}
#     ]
#   ]}}
Macro.to_string(fragment)
# "{:ok, defmodule(A) do\n  b(c) do\n    c + 1\n  end\nend}"


Code.eval_string("[a, a*b, c]", [a: 2, b: 3, c: 4])
# {[2, 6, 4], [c: 4, b: 3, a: 2]}
