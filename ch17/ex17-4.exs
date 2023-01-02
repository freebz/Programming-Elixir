# 17.5 인터페이스 다듬기

Sequence.Server.start_link 123
# {:ok, #PID<0.160.0>}
Sequence.Server.next_number
# 123
Sequence.Server.next_number
# 124
Sequence.Server.increment_number 100
# :ok
Sequence.Server.next_number
# 225
