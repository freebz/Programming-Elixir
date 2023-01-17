# 21.3 더 큰 예제

Dictionary.start_link
# {:ok, #PID<0.116.0>}
Enum.map(1..4, &"words/list#{&1}") |> WordlistLoader.load_from_files
# [:ok, :ok, :ok, :ok]
Dictionary.anagrams_of "organ"
# ["ronga", "rogan", "orang", "nagor", "groan", "grano", "goran", "argon", "angor"]
