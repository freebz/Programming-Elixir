# 22.4 값 주입에 바인딩 사용하기

defmacro mydef(name) do
  quote do
    def unquote(name)(), do: unquote(name)
  end
end


c("macro_no_binding.exs")
# ** (CompileError) macro_no_binding.exs:13: invalid syntax in def x1()


c("macro_binding.exs")
# fred


defmacro mydef(name) do
  quote bind_quoted: [name: name] do
    "Hello #{name}"
  end
end


defmacro mydef(name) do
  quote do
    name = unquote(name)
    "Hello #{name}"
  end
end


def unquote(name)(), do: name
# Compile Error
