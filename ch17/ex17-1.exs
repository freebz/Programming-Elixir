# 17.2.2 첫 번째 OTP 서버

{ :ok, pid } = GenServer.start_link(Sequence.Server, 100)
# {:ok, #PID<0.181.0>}
GenServer.call(pid, :next_number)
# 100
GenServer.call(pid, :next_number)
# 101
GenServer.call(pid, :next_number)
# 102



defmodule Stack do
  use GenServer

  def init(initial_stack) do
    { :ok, initial_stack }
  end

  def handle_call(:pop, _from, [head | tail]) do
    { :reply, head, tail }
  end
end



r Sequence.Server
# warning: redefining module Sequence.Server (current version loaded from _build/dev/lib/sequence/ebin/Elixir.Sequence.Server.beam)
#   lib/sequence/server.ex:3

# {:reloaded, Sequence.Server, [Sequence.Server]}



{ :ok, pid } = GenServer.start_link(Sequence.Server, 100)
# {:ok, #PID<0.217.0>}
GenServer.call(pid, :next_number)
# 100
GenServer.call(pid, :next_number)
# 101
GenServer.cast(pid, {:increment_number, 200})
# :ok
GenServer.call(pid, :next_number)
# 302
