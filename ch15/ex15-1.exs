# 15.1 간단한 프로세스

c("spawn-basic.ex")
# [SpawnBasic]


SpawnBasic.greet
# Hello
# :ok


spawn(SpawnBasic, :greet, [])
# Hello
# #PID<0.116.0>
