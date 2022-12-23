# 14.1.1 IEx.pry로 중단점 만들기

Buggy.parse_header << 0, 1, 0, 8, 0, 120 >>
# Break reached: Buggy.parse_header/1 (lib/buggy.ex:12)

#    10:   ) do
#    11: 
#    12:     require IEx; IEx.pry
#    13:     IO.puts "format: #{format}"
#    14:     IO.puts "tracks: #{tracks}"

binding
# [division: 120, format: 1, tracks: 8]
continue()
# format: 1
# tracks: 8
# ** (FunctionClauseError) no function clause matching in Buggy.decode/1


r Buggy
# {:reloaded, Buggy, [Buggy]}
Buggy.parse_header << 0, 1, 0, 8, 0, 120 >>
# Break reached: Buggy.parse_header/1 (lib/buggy.ex:12)

#    10:   ) do
#    11: 
#    12:     require IEx; IEx.pry
#    13:     IO.puts "format: #{format}"
#    14:     IO.puts "tracks: #{tracks}"

binding
# [division: <<0, 120>>, format: 1, tracks: 8]
continue
# format: 1
# tracks: 8
# division: 0 fps, 120/frame
# :ok
