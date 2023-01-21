# macros/eg2.exs

defmodule My do
  defmacro macro(code) do
    quote do
      IO.inspect(unquote(code))
    end
  end
end
