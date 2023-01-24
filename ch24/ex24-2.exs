# 24.2 프로토콜 구현하기

defimpl Inspect, for: PID do
  def inspect(pid, _opts) do
    "#PID" <> IO.iodata_to_binary(pid_to_list(pid))
  end
end

defimpl Inspect, for: Reference do
  def inspect(ref, _opts) do
    '#Ref' ++ rest = :erlang.ref_to_list(ref)
    "#Reference" <> IO.iodata_to_binary(rest)
  end
end



inspect self
# "#PID<0.106.0>"
defimpl Inspect, for: PID do
  def inspect(pid, _) do
    "#Process: " <> IO.iodata_to_binary(:erlang.pid_to_list(pid)) <> "!!"
  end
end
# warning: redefining module Inspect.PID
# {:module, Inspect.PID, <<70, 79....
inspect self
# "#Process: <0.106.0>!!"
