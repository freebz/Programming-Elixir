# 15.2 프로세스 부하

defmodule Exercise do
  def echo(pid) do
    receive do
      token -> send pid, token
    end
  end
  
  def run() do
    p1 = spawn(Exercise, :echo, [self()])
    p2 = spawn(Exercise, :echo, [self()])

    send p1, "fred"
    send p2, "betty"

    receive do
      token -> IO.puts token
    end
    receive do
      token -> IO.puts token
    end
  end
end
