# 17.2.3 서버 실행 추적하기

{:ok, pid} = GenServer.start_link(Sequence.Server, 100, [debug: [:trace]])
# {:ok, #PID<0.223.0>}
GenServer.call(pid, :next_number)
# *DBG* <0.223.0> got call next_number from <0.209.0>
# *DBG* <0.223.0> sent 100 to <0.209.0>, new state 101
# 100
GenServer.call(pid, :next_number)
# *DBG* <0.223.0> got call next_number from <0.209.0>
# *DBG* <0.223.0> sent 101 to <0.209.0>, new state 102
# 101



{:ok, pid} = GenServer.start_link(Sequence.Server, 100, [debug: [:statistics]])
# {:ok, #PID<0.229.0>}
GenServer.call(pid, :next_number)
# 100
GenServer.call(pid, :next_number)
# 101
:sys.statistics pid, :get
# {:ok,
#  [
#    start_time: {{2023, 1, 2}, {1, 31, 16}},
#    current_time: {{2023, 1, 2}, {1, 31, 57}},
#    reductions: 96,
#    messages_in: 2,
#    messages_out: 2
#  ]}



:sys.trace pid, true
# :ok
GenServer.call(pid, :next_number)
# *DBG* <0.229.0> got call next_number from <0.209.0>
# *DBG* <0.229.0> sent 102 to <0.209.0>, new state 103
# 102
:sys.trace pid, false
# :ok
GenServer.call(pid, :next_number)
# 103



:sys.get_status pid
# {:status, #PID<0.229.0>, {:module, :gen_server},
#  [
#    [
#      "$ancestors": [#PID<0.209.0>, #PID<0.79.0>],
#      "$initial_call": {Sequence.Server, :init, 1}
#    ],
#    :running,
#    #PID<0.209.0>,
#    [statistics: {{{2023, 1, 2}, {1, 31, 16}}, {:reductions, 15}, 4, 4}],
#    [
#      header: 'Status for generic server <0.229.0>',
#      data: [
#        {'Status', :running},
#        {'Parent', #PID<0.209.0>},
#        {'Logged events', []}
#      ],
#      data: [{'State', 104}]
#    ]
#  ]}



:sys.get_status pid
# {:status, #PID<0.229.0>, {:module, :gen_server},
#  [
#    [
#      "$ancestors": [#PID<0.209.0>, #PID<0.79.0>],
#      "$initial_call": {Sequence.Server, :init, 1}
#    ],
#    :running,
#    #PID<0.209.0>,
#    [statistics: {{{2023, 1, 2}, {1, 31, 16}}, {:reductions, 15}, 4, 4}],
#    [
#      header: 'Status for generic server <0.229.0>',
#      data: [
#        {'Status', :running},
#        {'Parent', #PID<0.209.0>},
#        {'Logged events', []}
#      ],
#      data: [{'State', "My current state is '104', and I'm happy"}]
#    ]
#  ]}



defmodule Stack do
  use GenServer

  def init(initial_stack) do
    { :ok, initial_stack }
  end

  def handle_call(:pop, _from, [head | tail]) do
    { :reply, head, tail }
  end

  def handle_cast({:push, value}, current_stack) do
    { :noreply, [value | current_stack] }
  end
end
