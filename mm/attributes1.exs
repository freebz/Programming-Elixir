# 코드: mm/attributes1.exs

defmodule Example do
  @attr "one"
  def first, do: @attr
  @attr "two"
  def second, do: @attr
end
IO.puts "#{Example.second}  #{Example.first}"    # => two one
