# 8.6 구조체

s1 = %Subscriber{}
# %Subscriber{name: "", over_18: true, paid: false}
s2 = %Subscriber{ name: "Dave" }
# %Subscriber{name: "Dave", over_18: true, paid: false}
s3 = %Subscriber{ name: "Mary", over_18: true, paid: true }
# %Subscriber{name: "Mary", over_18: true, paid: true}

s3.name
# "Mary"
%Subscriber{name: a_name} = s3
# %Subscriber{name: "Mary", over_18: true, paid: true}
a_name
# "Mary"


s4 = %Subscriber{ s3 | name: "Marie" }
# %Subscriber{name: "Marie", over_18: true, paid: true}


a1 = %Attendee{name: "Dave", over_18: true}
# %Attendee{name: "Dave", over_18: true, paid: false}
Attendee.may_attend_after_party(a1)
# false
a2 = %Attendee{a1 | paid: true}
# %Attendee{name: "Dave", over_18: true, paid: true}
Attendee.may_attend_after_party(a2)
# true
Attendee.print_vip_badge(a2)
# Very cheap badge for Dave
# :ok
a3 = %Attendee{}
# %Attendee{name: "", over_18: true, paid: false}
Attendee.print_vip_badge(a3)
# ** (RuntimeError) missing name for badge
