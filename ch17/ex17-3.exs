# 17.4 프로세스에 이름 짓기

{ :ok, pid } = GenServer.start_link(Sequence.Server, 100, name: :seq)
# {:ok, #PID<0.160.0>}
GenServer.call(:seq, :next_number)
# 100
GenServer.call(:seq, :next_number)
# 101
:sys.get_status :seq
# {:status, #PID<0.160.0>, {:module, :gen_server},
#  [
#    [
#      "$initial_call": {Sequence.Server, :init, 1},
#      "$ancestors": [#PID<0.158.0>, #PID<0.78.0>]
#    ],
#    :running,
#    #PID<0.158.0>,
#    [],
#    [
#      header: 'Status for generic server seq',
#      data: [
#        {'Status', :running},
#        {'Parent', #PID<0.158.0>},
#        {'Logged events', []}
#      ],
#      data: [{'State', "My current state is '102', and I'm happy"}]
#    ]
#  ]}
