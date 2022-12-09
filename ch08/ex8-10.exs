# 8.8 집합

set1 = 1..5 |> Enum.into(MapSet.new)
# #MapSet<[1, 2, 3, 4, 5]>
set2 = 3..8 |> Enum.into(MapSet.new)
# #MapSet<[3, 4, 5, 6, 7, 8]>
MapSet.member? set1, 3
# true
MapSet.union set1, set2
# #MapSet<[1, 2, 3, 4, 5, 6, 7, 8]>
MapSet.difference set1, set2
# #MapSet<[1, 2]>
MapSet.difference set2, set1
# #MapSet<[6, 7, 8]>
MapSet.intersection set1, set2
# #MapSet<[3, 4, 5]>
