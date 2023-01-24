# 24.4 프로토콜과 구조체

c "basic.exs"
# [Blob]
b = %Blob{content: 123}
# %Blob{content: 123}
inspect b
# "%Blob{content: 123}"


inspect b, structs: false
# %{__struct__: Blob, content: 123}"
