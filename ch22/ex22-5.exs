# 22.3.2 myif 매크로로 돌아와서

c("myif.ex")
# 1 != 2


defmodule My do
  defmacro myunless(condition, clauses) do
    do_clause   = Keyword.get(clauses, :do, nil)
    else_clause = Keyword.get(clauses, :else, nil)
    quote do
      if unquote(condition) do
	unquote(else_clause)
      else
	unquote(do_clause)
      end
    end
  end
end

defmodule Exercise do
  require My
  My.myunless 1==2 do
    IO.puts "1 != 2"
  else
    IO.puts "1 == 2"
  end
end



defmodule Times do
  defmacro times_n(n) do
    name = String.to_atom("times_#{n}")
    quote do
      def unquote(name)(m) do
	unquote(n) * m
      end
    end
  end
end

defmodule Test do
  require Times
  Times.times_n(3)
  Times.times_n(4)
end

IO.puts Test.times_3(4) # 12
IO.puts Test.times_4(5) # 20
