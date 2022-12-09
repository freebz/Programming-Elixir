# 8.3 맵

map = %{ name: "Dave", likes: "Programming", where: "Dollas" }
# %{likes: "Programming", name: "Dave", where: "Dollas"}
Map.keys map
# [:likes, :name, :where]
Map.values map
# ["Programming", "Dave", "Dollas"]
map[:name]
# "Dave"
map.name
# "Dave"
map1 = Map.drop map, [:where, :likes]
# %{name: "Dave"} 
map2 = Map.put map, :also_likes, "Ruby"
# %{also_likes: "Ruby", likes: "Programming", name: "Dave", where: "Dollas"}
Map.keys map2
# [:also_likes, :likes, :name, :where]
Map.has_key? map1, :where
# false
{ value, updated_map } = Map.pop map2, :also_likes
# {"Ruby", %{likes: "Programming", name: "Dave", where: "Dollas"}}
Map.equal? map, updated_map
# true
