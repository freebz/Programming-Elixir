# 18.1 슈퍼바이저와 워커

Sequence.Server.increment_number 3
# :ok
Sequence.Server.next_number
# 126


Sequence.Server.increment_number "cat"
# :ok
# iex> 
# 21:39:43.386 [error] GenServer Sequence.Server terminating
# ** (ArithmeticError) bad argument in arithmetic expression
#     :erlang.+(127, "cat")
#     (sequence 0.1.0) lib/sequence/server.ex:31: Sequence.Server.handle_cast/2
#     (stdlib 3.17) gen_server.erl:695: :gen_server.try_dispatch/4
#     (stdlib 3.17) gen_server.erl:771: :gen_server.handle_msg/6
#     (stdlib 3.17) proc_lib.erl:226: :proc_lib.init_p_do_apply/3
# Last message: {:"$gen_cast", {:increment_number, "cat"}}
# State: [data: [{'State', "My current state is '127', and I'm happy"}]]
Sequence.Server.next_number
# 123
Sequence.Server.next_number
# 124




defmodule Stack.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      { Stack.Server, [5, "cat", 9] },
    ]

    opts = [strategy: :one_for_one, name: Stack.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

defmodule Stack.Server do
  use GenServer

  def start_link(initial_stack) do
    GenServer.start_link(__MODULE__, initial_stack, name: __MODULE__)
  end

  def pop do
    GenServer.call __MODULE__, :pop
  end

  def push(value) do
    GenServer.cast __MODULE__, {:push, value}
  end
  
  def init(initial_stack) do
    { :ok, initial_stack }
  end

  def handle_call(:pop, _from, [head | tail]) do
    { :reply, head, tail }
  end

  def handle_cast({:push, n}, _current_stack) when n < 10 do
    System.halt(n)
  end

  def handle_cast({:push, n}, current_stack) do
    { :noreply, [n | current_stack] }
  end

  def terminate(reason, state) do
    IO.puts "#{reason}, #{state}"
  end
end
