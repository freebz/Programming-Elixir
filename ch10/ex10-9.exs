# 10.4.2 컴프리헨션 문의 스코프

name = "Dave"
# "Dave"
for name <- [ "cat", "dog" ], do: String.upcase(name)
# ["CAT", "DOG"]
name
# "Dave"
