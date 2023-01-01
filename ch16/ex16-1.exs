# 16.1 노드에 이름 짓기

Node.self
# :nonode@nohost

Node.self
# :"wibble@light-boy.local"

Node.self
# :"wobble@light-boy"


Node.list
# []
Node.connect :"node_one@light-boy"
# true
Node.list
# [:"node_one@light-boy"]


func = fn -> IO.inspect Node.self end
# #Function<45.65746770/0 in :erl_eval.expr/5>
spawn(func)
# #PID<0.119.0>
# :node_one@light-boy


Node.spawn(:"node_one@light-boy", func)
# #PID<0.121.0>
# :node_one@light-boy
Node.spawn(:"node_two@light-boy", func)
# #PID<11190.123.0>
# :node_two@light-boy


fun = fn -> IO.puts(Enum.join(File.ls!, " ,")) end
Node.spawn(:"node_two@light-boy", fun)
