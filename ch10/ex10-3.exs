# 10.2 Stream: 지연 계산하기

# 10.2.1 스트림 조합하기

s = Stream.map [1, 3, 5, 7], &(&1 + 1)
# #Stream<[enum: [1, 3, 5, 7], funs: [#Function<47.58486609/1 in Stream.map/2>]]>
Enum.to_list s
# [2, 4, 6, 8]


squares = Stream.map [1, 2, 3, 4], &(&1*&1)
# #Stream<[enum: [1, 2, 3, 4], funs: [#Function<47.58486609/1 in Stream.map/2>]]>

plus_ones = Stream.map squares, &(&1+1)
# #Stream<[enum: [1, 2, 3, 4],
#          funs: [#Function<47.58486609/1 in Stream.map/2>,
#                 #Function<47.58486609/1 in Stream.map/2>] ]>

odds = Stream.filter plus_ones, fn x -> rem(x,2) == 1 end
# #Stream<[enum: [1, 2, 3, 4],
#          funs: [#Function<47.58486609/1 in Stream.map/2>,
# 	          #Function<47.58486609/1 in Stream.map/2>,
# 	          #Function<39.58486609/1 in Stream.filter/2>] ]>

Enum.to_list odds
# [5, 17]
