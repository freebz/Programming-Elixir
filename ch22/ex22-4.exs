# 22.3.1 unquote 함수

defmacro macro(code) do
  quote do
    IO.inspect(code)
  end
end


# ** (CompileError).../eg2.ex:11: undefined function code/0


Code.eval_quoted(quote do: [1,2,unquote([3,4])])
# {[1, 2, [3, 4]], []}

Code.eval_quoted(quote do: [1,2,unquote_splicing([3,4])])
# {[1, 2, 3, 4], []}

Code.eval_quoted(quote do: [?a, ?=, unquote_splicing('1234')])
# {'a=1234', []}
