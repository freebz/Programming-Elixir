# 4.5.1 맵에 접근하기

states = %{"AL" => "Alabama", "WI" => "Wisconsin"}
# %{"AL" => "Alabama", "WI" => "Wisconsin"}
states["AL"]
# "Alabama"
states["TX"]
# nil

response_types = %{ {:error, :enoent} => :fatal,
		    {:error, :busy} => :retry }
# %{{:error, :busy} => :retry, {:error, :enoent} => :fatal}
response_types[{:error, :busy}]
# :retry


colors = %{red: 0xff0000, green: 0x00ff00, blue: 0x0000ff}
# %{blue: 255, green: 65280, red: 16711680}
colors[:red]
# 16711680
colors.green
# 65280
