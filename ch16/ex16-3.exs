# 16.2.1 언제 프로세스에 이름이 생기나

defmodule Ticker do
  @interval 2000  # 2초
  @name     :ticker

  def start do
    pid = spawn(__MODULE__, :generator , [[], []])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    send :global.whereis_name(@name), { :register , client_pid }
  end

  def generator(clients, chan) do
    receive do
      { :register , pid } ->
	IO.puts "registering  #{ inspect pid }"
	generator([pid|clients], chan)
    after
      @interval ->
	IO.puts "tick"
	tick(clients, chan)
	generator(clients, chan)
    end
  end

  defp tick([], []) do
  end
  
  defp tick(clients, []) do
    tick(clients, Enum.reverse clients)
  end

  defp tick(clients, [h | t]) do
    send h, { :tick }
    generator(clients, t)
  end
end



defmodule Client do
  def start do
    pid = spawn(__MODULE__, :receiver , [])
    Ticker.register(pid)
  end

  def receiver do
    receive do
      { :tick } ->
	IO.puts "tock in client"
	receiver()
    end
  end
end
