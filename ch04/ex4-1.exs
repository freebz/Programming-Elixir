# 4.2 값 타입

Regex.run ~r{[aeiou]}, "caterpillar"
# ["a"]
Regex.scan ~r{[aeiou]}, "caterpillar"
# [["a"], ["e"], ["i"], ["a"]]
Regex.split ~r{[aeiou]}, "caterpillar"
# ["c", "t", "rp", "ll", "r"]
Regex.replace ~r{[aeiou]}, "caterpillar", "*"
# "c*t*rp*ll*r"
