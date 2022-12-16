# 12.1 if와 unless

if 1 == 1, do: "true part", else: "false part"
# "true part"

if 1 == 2, do: "true part", else: "false part"
# "false part"



if 1 == 1 do
  "true part"
else
  "false part"
end
# "true part"



unless 1 == 1, do: "error", else: "OK"
# "OK"
unless 1 == 2, do: "OK", else: "error"
# "OK"
unless 1 == 2 do
  "OK"
else
  "error"
end
# "OK"
