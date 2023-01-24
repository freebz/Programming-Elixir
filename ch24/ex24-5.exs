# 24.5.1 기본 내장 프로토콜: Enumerable, Collectable

defimpl Enumerable, for: Midi do
  # ...
end


defprotocol Enumerable do
  def count(collection)
  def member?(collection, value)
  def reduce(collection, acc, fun)
  def slice(collection)
end


midi = Midi.from_file("dueling-banjos.mid")
# %Midi{
#   content: <<77, 84, 104, 100, 0, 0, 0, 6, 0, 1, 0, 8, 1, 128, 77, 84, 114, 107,
#     0, 0, 0, 30, 0, 255, 88, 4, 4, 2, 24, 8, 0, 255, 81, 3, 9, 39, 192, 130,
#     219, 114, 255, 81, 3, 6, 138, 26, 132, 144, 14, ...>>
# }
Enum.take(midi, 2)
# [
#   %Midi.Frame{data: <<0, 1, 0, 8, 1, 128>>, length: 6, type: "MThd"},
#   %Midi.Frame{
#     data: <<0, 255, 88, 4, 4, 2, 24, 8, 0, 255, 81, 3, 9, 39, 192, 130, 219,
#       114, 255, 81, 3, 6, 138, 26, 132, 144, 14, 255, 47, 0>>,
#     length: 30,
#     type: "MTrk"
#   }
# ]


r Enumerable.Midi
# warning: redefining module Midi (current version defined in memory)
#   midi.exs:3

# warning: redefining module Midi.Frame (current version defined in memory)
#   midi.exs:7

# warning: redefining module Enumerable.Midi (current version defined in memory)
#   midi.exs:28

# warning: function member?/2 required by protocol Enumerable is not implemented (in module Enumerable.Midi)
#   midi.exs:28: Enumerable.Midi (module)

# warning: function slice/1 required by protocol Enumerable is not implemented (in module Enumerable.Midi)
#   midi.exs:28: Enumerable.Midi (module)

# {:reloaded, Enumerable.Midi, [Midi.Frame, Midi, Enumerable.Midi]}
Enum.count midi
# 9


1..4 |> Enum.into([])
# [1, 2, 3, 4]
[ {1, 2}, {"a", "b"}] |> Enum.into(%{})
# %{1 => 2, "a" => "b"}


list = Enum.to_list(midi)
# [
#   %Midi.Frame{data: <<0, 1, 0, 8, 1, 128>>, length: 6, type: "MThd"},
#   %Midi.Frame{
#     data: <<0, 255, 88, 4, 4, 2, 24, 8, 0, 255, 81, 3, 9, 39, 192, 130, 219,
#       114, 255, 81, 3, 6, 138, 26, 132, 144, 14, 255, 47, 0>>,
#     length: 30,
#     type: "MTrk"
#   },
#   ...
# ]
new_midi = Enum.into(list, %Midi{})
# %Midi{
#   content: <<77, 84, 104, 100, 0, 0, 0, 6, 0, 1, 0, 8, 1, 128, 77, 84, 114, 107,
#     0, 0, 0, 30, 0, 255, 88, 4, 4, 2, 24, 8, 0, 255, 81, 3, 9, 39, 192, 130,
#     219, 114, 255, 81, 3, 6, 138, 26, 132, 144, 14, ...>>
# }
new_midi == midi
# true
Enum.take(new_midi, 1)
# [%Midi.Frame{data: <<0, 1, 0, 8, 1, 128>>, length: 6, type: "MThd"}]


midi2 = %Midi{}
# %Midi{content: ""}
midi2 = Enum.take(midi, 1) |> Enum.into(midi2)
# %Midi{content: <<77, 84, 104, 100, 0, 0, 0, 6, 0, 1, 0, 8, 1, 128>>}
midi2 = [Enum.at(midi, 3)] |> Enum.into(midi2)
# %Midi{
#   content: <<77, 84, 104, 100, 0, 0, 0, 6, 0, 1, 0, 8, 1, 128, 77, 84, 114, 107,
#     0, 0, 11, 60, 0, 255, 3, 9, 83, 84, 69, 69, 76, 32, 71, 84, 82, 140, 0, 193,
#     25, 0, 177, 7, 127, 0, 177, 10, 100, 0, 177, ...>>
# }
Enum.count(midi2)
# 2
