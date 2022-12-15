# 11.5 큰따옴표 문자열은 바이너리다

dqs = "∂x/∂y"
# "∂x/∂y"
String.length dqs
# 5
byte_size dqs
# 9
String.at(dqs, 0)
# "∂"
String.codepoints(dqs)
# ["∂", "x", "/", "∂", "y"]
String.split(dqs, "/")
# ["∂x", "∂y"]
