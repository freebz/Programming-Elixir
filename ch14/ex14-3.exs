# 14.1.2 break를 이용해 중단점 만들기

require IEx
# IEx
break! Buggy.decode/1
# 1
breaks

#  ID   Module.function/arity   Pending stops
# ---- ----------------------- ---------------
#  1    Buggy.decode/1          1

Buggy.parse_header << 0, 1, 0, 8, 0, 120 >>
# format: 1
# tracks: 8
# Break reached: Buggy.decode/1 (lib/buggy.ex:22)

#    20:   end
#    21: 
#    22:   def decode(<< 0::1, fps::7, beats::8 >>) do
#    23:     "#{-fps} fps, #{beats}/frame"
#    24:   end

binding
# [beats: 120, fps: 0]
