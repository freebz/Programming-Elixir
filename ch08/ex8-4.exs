# 8.4.2 변수에 저장된 키로는 매칭할 수 있다

data = %{ name: "Dave", state: "TX", likes: "Elixir" }
# %{likes: "Elixir", name: "Dave", state: "TX"}
for key <- [ :name, :likes ] do
    %{ ^key => value } = data
    value
end
# ["Dave", "Elixir"]
