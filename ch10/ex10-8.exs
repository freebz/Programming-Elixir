# 10.4.1 비트스트링에 컴프리헨션 사용하기

for << ch <- "hello" >>, do: ch
# 'hello'
for << ch <- "hello" >>, do: <<ch>>
# ["h", "e", "l", "l", "o"]


for << << b1::size(2), b2::size(3), b3::size(3) >> <- "hello" >>,
  do: "0#{b1}#{b2}#{b3}"
# ["0150", "0145", "0154", "0154", "0157"]
