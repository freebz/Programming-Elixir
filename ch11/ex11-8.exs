# 11.6 바이너리와 패턴 매칭

# 11.6.1 바이너리로 문자열 처리하기

defmodule Exercise do
  def capitalize_sentences(str) do
    Enum.join(Enum.map(String.split(str, ". "), &String.capitalize/1), ". ")
  end

  def orderList(orders, tax_rates) do
    for x <- orders do
      x ++ [ total_amount:
	     x[:net_amount] * (1 + Keyword.get(tax_rates, x[:ship_to], 0)) ]
    end
  end

  def orders(filename, tax_rates) do
    {:ok, file} = File.open filename
    head = IO.read(file, :line) |> String.split ","
    lines = Enum.into IO.stream(file, :line), []
    contents = Enum.map lines, &(String.split(String.trim_trailing(&1), ","))
    orders = Enum.map contents, fn [id, ship_to, net_amount] ->
      [
	id: String.to_integer(id),
	ship_to: String.to_atom(String.trim_leading ship_to, ":"),
	net_amount: String.to_float(net_amount)
      ]
    end
    orderList(orders, tax_rates)
  end
end


Exercise.capitalize_sentences("oh. a DOG. woof. ")


tax_rates = [NC: 0.075, TX: 0.08]


Exercise.orders("orders.csv", tax_rates)
