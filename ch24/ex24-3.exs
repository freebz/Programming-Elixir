# 24.3 사용 가능한 자료형

c("../protocols/is_collection.exs")
# 1:  false
# 1.0:  false
# [1, 2]:  true
# {1, 2}:  true
# %{}:  true
# "cat":  true


defprotocol Caesar do
  def encrypt(string, shift)
  def rot13(string)
end

defimpl Caesar, for: List do
  def encrypt(string, shift) do
    Enum.map(string, fn c ->
      Integer.mod(c - ?a + shift, 26) + ?a
    end)
  end
  def rot13(string), do: encrypt(string, 13)
end

defimpl Caesar, for: BitString do
  def encrypt(string, shift) do
    string
    |> String.to_charlist
    |> Caesar.encrypt(shift)
    |> to_string
  end
  def rot13(string), do: encrypt(string, 13)
end

Caesar.encrypt('abz', 1)
Caesar.encrypt("abz", 1)
Caesar.rot13('abz')
Caesar.rot13("abz")
