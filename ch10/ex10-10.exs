# 10.4.3 컴프리헨션 문이 반환하는 값

for x <- ~w{ cat dog }, into: %{}, do: { x, String.upcase(x) }
# %{"cat" => "CAT", "dog" => "DOG"}


for x <- ~w{ cat dog }, into: Map.new, do: { x, String.upcase(x) }
# %{"cat" => "CAT", "dog" => "DOG"}


for x <- ~w{ cat dog }, into: %{"ant" => "ANT"}, do: {x, String.upcase(x) }
# %{"ant" => "ANT", "cat" => "CAT", "dog" => "DOG"} 


for x <- ~w{ cat dog }, into: IO.stream(:stdio,:line), do: "<<#{x}>>\n"
# <<cat>>
# <<dog>>
# %IO.Stream{device: :standard_io, line_or_bytes: :line, raw: false}



defmodule Exercise do
  def span(from, to) do
    span(from, to, [])
  end

  def span(from, to, acc) when from > to, do: acc
  def span(from, to, acc) do
    span(from, to - 1, [to | acc])
  end

  def prime(n) do
    for x <- span(2, n), isPrime?(x), do: x
  end

  def isPrime?(n) do
    Enum.all?(span(2, div(n, 2)), &(rem(n, &1) != 0))
  end

  def orderList(orders, tax_rates) do
    for x <- orders do
      x ++ [ total_amount:
	     x[:net_amount] * (1 + Keyword.get(tax_rates, x[:ship_to], 0)) ]
    end
  end
end

tax_rates = [NC: 0.075, TX: 0.08]

orders = [
  [ id: 123, ship_to: :NC, net_amount: 100.00 ],
  [ id: 124, ship_to: :OK, net_amount: 35.50 ],
  [ id: 125, ship_to: :TX, net_amount: 24.00 ],
  [ id: 126, ship_to: :TX, net_amount: 44.80 ],
  [ id: 127, ship_to: :NC, net_amount: 25.00 ],
  [ id: 128, ship_to: :MA, net_amount: 10.00 ],
  [ id: 129, ship_to: :CA, net_amount: 102.00 ],
  [ id: 130, ship_to: :NC, net_amount: 50.00 ] ]


Exercise.orderList(orders, tax_rates)
