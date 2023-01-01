# 16.3 입력, 출력, PID, 노드

defmodule Ticker do
  @interval 2000  # 2초
  @name     :ticker

  def start do
    pid = spawn(__MODULE__, :generator , [[]])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    send :global.whereis_name(@name), { :register , client_pid }
  end

  def generator([]) do
    receive do
      { :register , pid } ->
	IO.puts "registering  #{ inspect pid }"
	tick([pid])
	generator([pid])
    end
  end

  def generator(clients) do
    receive do
      { :register , pid } ->
	IO.puts "registering  #{ inspect pid }"
	generator([pid|clients])
      { :loop } ->
	tick(Enum.reverse clients)
	generator(clients)
    end
  end

  def loop do
    send :global.whereis_name(@name), { :loop }
  end
  
  defp tick([h | t]) do
    IO.puts "rotate"
    send h, { :tick , t , @interval }
  end
end



defmodule Client do
  #@interval 2000  # 2초
  
  def start do
    pid = spawn(__MODULE__, :receiver , [])
    Ticker.register(pid)
  end

  def receiver() do
    receive do
      { :tick , chan, interval } ->
	IO.puts "tock in client"
	receiver(chan, interval)
    end
  end

  def receiver(chan, interval) do
    receive do
    after
      interval ->
	tick(chan, interval)
	receiver
    end
  end

  defp tick([], _interval ) do
    IO.puts "tick"
    Ticker.loop
  end

  defp tick([h | t], interval) do
    IO.puts "tick"
    send h, { :tick , t , interval }
  end
end
