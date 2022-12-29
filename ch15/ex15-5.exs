# 15.3.2 프로세스 모니터링하기

defmodule Exercise1 do
  import :timer, only: [ sleep: 1 ]

  def sad_function(pid) do
    send pid, 'hello'
    exit(:boom)    
  end

  def run do
    spawn_link(Exercise1, :sad_function, [self()])
    sleep 500
    receive do
      msg ->
	IO.puts "MESSAGE RECEIVED: #{inspect msg}"
    end
  end
end

Exercise1.run



defmodule Exercise2 do
  import :timer, only: [ sleep: 1 ]

  def sad_function(pid) do
    send pid, 'hello'
    raise "boom"
  end

  def run do
    spawn_link(Exercise2, :sad_function, [self()])
    sleep 500
    receive do
      msg ->
	IO.puts "MESSAGE RECEIVED: #{inspect msg}"
    end
  end
end

Exercise2.run



defmodule Exercise3 do
  import :timer, only: [ sleep: 1 ]

  def sad_function(pid) do
    send pid, 'hello'
    exit(:boom)    
  end

  def run do
    spawn_monitor(Exercise3, :sad_function, [self()])
    sleep 500
    receive do
      msg ->
	IO.puts "MESSAGE RECEIVED: #{inspect msg}"
    end
  end
end

Exercise3.run



defmodule Exercise4 do
  import :timer, only: [ sleep: 1 ]

  def sad_function(pid) do
    send pid, 'hello'
    raise "boom"
  end

  def run do
    spawn_monitor(Exercise4, :sad_function, [self()])
    sleep 500
    receive do
      msg ->
	IO.puts "MESSAGE RECEIVED: #{inspect msg}"
    end
  end
end

Exercise4.run
