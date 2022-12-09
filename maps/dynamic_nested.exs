# 코드: maps/dynamic_nested.exs

nested = %{
  buttercup: %{
    actor: %{
      first: "Robin",
      last:  "Wright"
    },
    role: "princess"
  },
  westley: %{
    actor: %{
      first: "Cary",
      last:  "Elwis"    # 오타!
    },
    role: "farm boy"
  }
}

IO.inspect get_in(nested, [:buttercup])
# => %{actor: %{first: "Robin", last: "Wright"}, role: "princess"}

IO.inspect get_in(nested, [:buttercup, :actor])
# => %{first: "Robin", last: "Wright"}

IO.inspect get_in(nested, [:buttercup, :actor, :first])
# => "Robin"

IO.inspect put_in(nested, [:buttercup, :actor, :last], "Elwes")
# => %{buttercup: %{actor: %{first: "Robin", last: "Elwes"}, role: "princess"},
# =>   westley: %{actor: %{first: "Cary", last: "Elwis"}, role: "farm boy"}}
