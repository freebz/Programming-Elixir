# 2.2 더 복잡한 매칭

list = [1, 2, 3]
# [1, 2, 3]
[a, b, c] = list
# [1, 2, 3]
a
# 1
b
# 2
c
# 3


list = [1, 2, [3, 4, 5]]
# [1, 2, [3, 4, 5]]
[a, b, c] = list
# [1, 2, [3, 4, 5]]
a
# 1
b
# 2
c
# [3, 4, 5]


list = [1, 2, 3]
# [1, 2, 3]
[a, 2, b] = list
# [1, 2, 3]
a
# 1
b
# 3


list = [1, 2, 3]
# [1, 2, 3]
[a, 1, b] = list
# ** (MatchError) no match of right hand side value: [1, 2, 3]
# (MatchError) 패턴이 우변의 값 [1, 2, 3]과 매치되지 않습니다
