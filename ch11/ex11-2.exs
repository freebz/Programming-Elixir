# 11.1.1 히어독스

IO.puts "start"
IO.write "
  my
  string
"
IO.puts "end"
# start

#   my
#   string
# end


IO.puts "start"
IO.write """
  my
  string
  """
IO.puts "end"
# start
# my
# string
# end
