# 11.5.1 문자열과 엘릭서 라이브러리

String.at("aog", 0)
# "a"
String.at("aog", -1)
# "g"


String.capitalize "école"
# "École"
String.capitalize "ÎÎÎÎÎ"
# "Îîîîî"


String.codepoints("José's ∂øg")
# ["J", "o", "s", "é", "'", "s", " ", "∂", "ø", "g"]


String.downcase "ØRSteD"
# "ørsted"


String.duplicate "Ho! ", 3
# "Ho! Ho! Ho! "


String.ends_with? "string", ["elix", "stri", "ring"]
# true


String.first "∂øg"
# "∂"


String.codepoints "noe\u0308l"
# ["n", "o", "e", "̈", "l"]
String.graphemes "noe\u0308l"
# ["n", "o", "ë", "l"]


String.jaro_distance("jonathan", "jonathon")
# 0.9166666666666666
String.jaro_distance("josé", "john")
# 0.6666666666666666


String.last "∂øg"
# "g"


String.length "∂x/∂y"
# 5


String.myers_difference("banana", "panama")
# [del: "b", ins: "p", eq: "ana", del: "n", ins: "m", eq: "a"]


defmodule MyString do
  def each(str, func), do: _each(String.next_codepoint(str), func)

  defp _each({codepoint, rest}, func) do
    func.(codepoint)
    _each(String.next_codepoint(rest), func)
  end

  defp _each(nil, _), do: []
end

MyString.each "∂øg", fn c -> IO.puts c end
# ∂
# ø
# g


String.pad_leading("cat", 5, ">")
# ">>cat"


String.pad_trailing("cat", 5)
# "cat  "


String.printable? "José"
# true
String.printable? "\x00 a null"
# false


String.replace "the cat on the mat", "at", "AT"
# "the cAT on the mAT"
String.replace "the cat on the mat", "at", "AT", global: false
# "the cAT on the mat"
String.replace "the cat on the mat", "at", "AT", insert_replaced: [0,2]
# "the catATat on the matATat"


String.reverse "pupils"
# "slipup"
String.reverse "Σƒ÷∂"
# "∂÷ƒΣ"


String.slice "the cat on the mat", 4, 3
# "cat"
String.slice "the cat on the mat", -3, 3
# mat"


String.split " the cat on the mat "
# ["the", "cat", "on", "the", "mat"]
String.split "the cat on the mat", "t"
# ["", "he ca", " on ", "he ma", ""]
String.split "the cat on the mat", ~r{[ae]}
# ["th", " c", "t on th", " m", "t"]
String.split "the cat on the mat", ~r{[ae]}, parts: 2
# ["th", " cat on the mat"]


String.starts_with? "string", ["elix", "stri", "ring"]
# true


String.trim "\t Hello \r\n"
# "Hello"


String.trim "!!!SALE!!!", "!"
# "SALE"


String.trim_leading "\t\f Hello\t\n"
# "Hello\t\n"


String.trim_leading "!!!SALE!!!", "!"
# "SALE!!!"


String.trim_trailing(" line \r\n")
# " line"


String.trim_trailing "!!!SALE!!!", "!"
# "!!!SALE"


String.upcase "José Ørsüd"
# "JOSÉ ØRSÜD"


String.valid? "∂"
# true
String.valid? "∂og"
# true
String.valid? << 0x80, 0x81 >>
# false


defmodule Exercise do
  def center([]) do
  end
  def center(list) do
    len = Enum.max Enum.map(list, &String.length/1)
    Enum.each(list, fn str ->
      IO.write String.duplicate " ", div(len - String.length(str), 2)
      IO.puts str
    end)
  end
end


Exercise.center(["cat", "zebra", "elephant"])
