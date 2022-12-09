# 8.7.3 Access 모듈

Access.pop(%{name: "Elixir", creator: "Valim"}, :name)
# {"Elixir", %{creator: "Valim"}}
Access.pop([name: "Elixir", creator: "Valim"], :name)
# {"Elixir", [creator: "Valim"]}
Access.pop(%{name: "Elixir", creator: "Valim"}, :year)
# {nil, %{creator: "Valim", name: "Elixir"}}
