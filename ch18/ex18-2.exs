# 18.1.1 재시작 전후로 프로세스 상태 관리하기

Sequence.Server.next_number
# 123
Sequence.Server.next_number
# 124
Sequence.Server.next_number
# 125
Sequence.Server.increment_number "cat"
# :ok
# iex> 
# 22:25:49.055 [error] GenServer Sequence.Server terminating
# ** (ArithmeticError) bad argument in arithmetic expression
#     :erlang.+(126, "cat")
#     (sequence 0.1.0) lib/sequence/server.ex:31: Sequence.Server.handle_cast/2
#     (stdlib 3.17) gen_server.erl:695: :gen_server.try_dispatch/4
#     (stdlib 3.17) gen_server.erl:771: :gen_server.handle_msg/6
#     (stdlib 3.17) proc_lib.erl:226: :proc_lib.init_p_do_apply/3
# Last message: {:"$gen_cast", {:increment_number, "cat"}}
# State: 126
Sequence.Server.next_number
# 126
Sequence.Server.next_number
# 127




defmodule Stack.Server do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def pop do
    GenServer.call __MODULE__, :pop
  end

  def push(value) do
    GenServer.cast __MODULE__, {:push, value}
  end
  
  def init(_) do
    { :ok, Stack.Stash.get() }
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
    Stack.Stash.update(state)
  end
end

defmodule Stack.Stash do
  use GenServer

  @me __MODULE__

  def start_link(initial_state) do
    GenServer.start_link(__MODULE__, initial_state, name: @me)
  end

  def get() do
    GenServer.call(@me, { :get })
  end

  def update(new_state) do
    GenServer.cast(@me, { :update, new_state })
  end

  # 서버 구현

  def init(initial_state) do
    { :ok, initial_state }
  end

  def handle_call({ :get }, _from, current_state ) do
    { :reply, current_state, current_state }
  end

  def handle_cast({ :update, new_state }, _current_state) do
    { :noreply, new_state }
  end

end

defmodule Stack.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      { Stack.Stash,  [5, "cat", 9] },
      { Stack.Server, nil },
    ]

    opts = [strategy: :rest_for_one, name: Stack.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
