# 8.4.1 패턴 매칭은 키를 바인딩하지는 않는다

%{ 2 => state } = %{ 1 => :ok, 2 => :error }
# %{1 => :ok, 2 => :error}
state
# :error


%{ item => :ok } = %{ 1 => :ok, 2 => :error }
# ** (CompileError) iex:22: cannot use variable item as map key inside a pattern...
