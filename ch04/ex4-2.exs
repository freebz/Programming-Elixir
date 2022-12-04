# 4.4 컬렉션 타입

# 4.4.1 튜플

{status, count, action} = {:ok, 42, "next"}
# {:ok, 42, "next"}
status
# :ok
count
# 42
action
# "next"


{status, file} = File.open("mix.exs")
# {:ok, #PID<0.39.0>}


{:ok, file} = File.open("mix.exs")
# {:ok, #PID<0.39.0>}
{:ok, file} = File.open("non-existent-file")
# ** (MatchError) no match of right hand side value: {:error, :enoent}
