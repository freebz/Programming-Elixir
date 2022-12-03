# 2.4 변수는 매칭당 한 번씩만 바인딩된다

[a, a] = [1, 1]
# [1, 1]
a
# 1
[b, b] = [1, 2]
# ** (MatchError) no match of right hand side value: [1, 2]


a = 1
# 1
[1, a, 3] = [1, 2, 3]
# [1, 2, 3]
a
# 2


a = 1
# 1
a = 2
# 2
^a = 1
# ** (MatchError) no match of right hand side value: 1


a = 1
# 1
[^a, 2, 3] = [1, 2, 3]		# a의 기존 값을 사용해 매칭
# [1, 2, 3]
a = 2
# 2
[^a, 2] = [1, 2]
# ** (MatchError) no match of right hand side value: [1, 2]
