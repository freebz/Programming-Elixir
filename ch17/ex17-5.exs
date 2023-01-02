# 17.6 서버를 컴포넌트로 만들기

defmodule Stack do
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
