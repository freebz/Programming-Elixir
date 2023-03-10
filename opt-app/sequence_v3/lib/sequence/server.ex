# 코드: opt-app/sequence_v3/lib/sequence/serve.ex

defmodule Sequence.Server do
  use     GenServer
  require Logger
  
  @vsn "1"
  
  defmodule State do
    defstruct(current_number: 0, delta: 1)
  end

  ####
  # 외부 API
  
  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def next_number do
    with number = GenServer.call(__MODULE__, :next_number) do
      "다음 번호는 #{number}번입니다."
    end
  end

  def increment_number(delta) do
    GenServer.cast __MODULE__, {:increment_number, delta}
  end

  ####
  # 젠서버 구현
  
  def init(_) do
    %{current_number: n, delta: delta} = Sequence.Stash.get()
    state = %State{ current_number: n, delta: delta }
    { :ok, state }
  end

  def handle_call(:next_number, _from, state = %{current_number: n}) do
    {:reply, n, %{state | current_number: n + state.delta} }
  end

  def handle_cast({:increment_number, delta}, state) do
    { :noreply, %{state | delta: delta }}
  end

  def terminate(_reason, state) do
    Sequence.Stash.update(state)
  end
  
  def code_change("0", old_state = current_number, _extra) do
    new_state = %State{
      current_number: current_number,
      delta:          1
    }
    Logger.info "Changing code from 0 to 1"
    Logger.info inspect(old_state)
    Logger.info inspect(new_state)
    { :ok, new_state }
  end
  
end
