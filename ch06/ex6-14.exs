# 6.12 라이브러리 찾기

defmodule Exercise_Erlang do
  def to_fix(n) do
    :io_lib.format("~.2f", [n])
  end
end

defmodule Exercise_Elixir do
  def get_env(n) do
    System.get_env(n)
  end
  def extname(file) do
    Path.extname(file)
  end
  def cwd() do
    File.cwd()
  end
  def shell(command) do
    System.shell(command)
  end
end
