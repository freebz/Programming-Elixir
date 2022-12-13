# 10.4 컴프리헨션 문

for x <- [ 1, 2, 3, 4, 5 ], do: x * x
# [1, 4, 9, 16, 25]
for x <- [ 1, 2, 3, 4, 5 ], x < 4, do: x * x
# [1, 4, 9]


for x <- [1,2], y <- [5,6], do: x * y
# [5, 6, 10, 12]
for x <- [1,2], y <- [5,6], do: {x, y}
# [{1, 5}, {1, 6}, {2, 5}, {2, 6}]


min_maxes = [{1,4}, {2,3}, {10,15}]
# [{1, 4}, {2, 3}, {10, 15}]
for {min,max} <- min_maxes, n <- min..max, do: n
# [1, 2, 3, 4, 2, 3, 10, 11, 12, 13, 14, 15]


first8 = [ 1,2,3,4,5,6,7,8 ]
# [1, 2, 3, 4, 5, 6, 7, 8]
for x <- first8, y <- first8, x >= y, rem(x*y, 10)==0, do: { x, y }
# [{5, 2}, {5, 4}, {6, 5}, {8, 5}]


reports = [ dallas: :hot, minneapolis: :cold, dc: :muggy, la: :smoggy ]
# [dallas: :hot, minneapolis: :cold, dc: :muggy, la: :smoggy]
for { city, weather } <- reports, do: { weather, city }
# [hot: :dallas, cold: :minneapolis, muggy: :dc, smoggy: :la]
