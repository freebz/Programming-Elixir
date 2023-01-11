# 20.6.2 첫 릴리스

Sequence.Server.next_number
# 456
Sequence.Server.next_number
# 457


Sequence.Server.next_number
# "다음 번호는 458번입니다."
Sequence.Server.next_number
# "다음 번호는 459번입니다."


Sequence.Server.next_number
# 460
Sequence.Server.next_number
# 461


Sequence.Server.next_number
# "다음 번호는 462번입니다."
Sequence.Server.increment_number 10
# :ok
Sequence.Server.next_number
# "다음 번호는 473번입니다."
Sequence.Server.next_number
# "다음 번호는 474번입니다."


# 23:48:42.205 [info]  Changing code from 0 to 1
# 23:48:42.205 [info]  475
# 23:48:42.206 [info]  %Sequence.Server.State{current_number: 475, delta: 1}


Sequence.Server.next_number
# "다음 번호는 475번입니다."
Sequence.Server.increment_number 10
# :ok
Sequence.Server.next_number
# "다음 번호는 476번입니다."
Sequence.Server.next_number
# "다음 번호는 486번입니다."
