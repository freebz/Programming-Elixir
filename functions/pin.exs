# 코드: functions/pin.exs

defmodule Greeter do
  def for(name, greeting) do
    fn
      (^name) -> "#{greeting} #{name}"
      (_)     -> "I don't know you"
    end
  end
end

mr_valim = Greeter.for("José", "Oil")
IO.puts mr_valim.("José")    # => Oil José
IO.puts mr_valim.("Dave")    # => I don't know you
