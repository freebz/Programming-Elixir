# 11.1.2 시길

~C[1\n2#{1+2}]
# '1\\n2\#{1+2}'
~c"1\n2#{1+2}"
# '1\n23'
~S[1\n2#{1+2}]
# "1\\n2\#{1+2}"
~s/1\n2#{1+2}/
# "1\n23"
~W[the c#{'a'}t sat on the mat]
# ["the", "c\#{'a'}t", "sat", "on", "the", "mat"]
~w[the c#{'a'}t sat on the mat]
# ["the", "cat", "sat", "on", "the", "mat"]
~D<1999-12-31>
# ~D[1999-12-31]
~T[12:34:56]
# ~T[12:34:56]
~N{1999-12-31 23:59:59}
# ~N[1999-12-31 23:59:59]


~w[the c#{'a'}t sat on the mat]a
# [:the, :cat, :sat, :on, :the, :mat]
~w[the c#{'a'}t sat on the mat]c
# ['the', 'cat', 'sat', 'on', 'the', 'mat']
~w[the c#{'a'}t sat on the mat]s
# ["the", "cat", "sat", "on", "the", "mat"]


~w"""
The
cat
sat
"""
# ["The", "cat", "sat"]


~r"""
hello
"""i
# ~r/hello\n/i
