# 4.5 맵

states = %{"AL" => "Alabama", "WI" => "Wisconsin"}
# %{"AL" => "Alabama", "WI" => "Wisconsin"}

responses = %{{:error, :enoent} => :fatal, {:error, :busy} => :retry}
# %{{:error, :busy} => :retry, {:error, :enoent} => :fatal}

colors = %{:red => 0xff0000, :green => 0x00ff00, :blue => 0x0000ff}
# %{blue: 255, green: 65280, red: 16711680}


%{"one" => 1, :two => 2, {1, 1, 1} => 3}
# %{:two => 2, {1, 1, 1} => 3, "one" => 1}


colors = %{red: 0xff0000, green: 0x00ff00, blue: 0x0000ff}
# %{blue: 255, green: 65280, red: 16711680}


name = "José Valim"
# "José Valim"
%{String.downcase(name) => name}
# %{"josé valim" => "José Valim"}
