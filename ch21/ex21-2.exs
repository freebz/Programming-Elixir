# 21.2 에이전트

{ :ok, count } = Agent.start(fn -> 0 end)
# {:ok, #PID<0.108.0>}
Agent.get(count, &(&1))
# 0
Agent.update(count, &(&1+1))
# :ok
Agent.update(count, &(&1+1))
# :ok
Agent.get(count, &(&1))
# 2


Agent.start(fn -> 1 end, name: Sum)
# {:ok, #PID<0.114.0>}
Agent.get(Sum, &(&1))
# 1
Agent.update(Sum, &(&1+99))
# :ok
Agent.get(Sum, &(&1))
# 100


c "agent_dict.exs"
# [Frequency]
Frequency.start_link
# {:ok, #PID<0.115.0>}
Frequency.add_word "dave"
# :ok
Frequency.words
# ["dave"]
Frequency.add_word "was"
# :ok
Frequency.add_word "here"
# :ok
Frequency.add_word "he"
# :ok
Frequency.add_word "was"
# :ok
Frequency.words
# ["dave", "he", "here", "was"]
Frequency.count_for("dave")
# 1
Frequency.count_for("was")
