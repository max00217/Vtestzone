module main

import clipboard
import os

mut counter := 0
mut cb := clipboard.new()
mut ft := ""

fstendclass := os.input("End of 1st Grade class: ").str()
fstendnum := os.input("End of 1st Grade number: ").str()

scdendclass := os.input("End of 2nd Grade class: ").str()
scdendnum := os.input("End of 2nd Grade number: ").str()

trdendclass := os.input("End of 3rd Grade class: ").str()
trdendnum := os.input("End of 3rd Grade number:  ").str()

numdiffrange := os.input("Number error range between 1st and 2nd grade: ").int()

fnum := ("1"+fstendclass+fstendnum).int()
snum := ("2"+scdendclass+scdendnum).int()
tnum := ("3"+trdendclass+trdendnum).int()

for i in 10101..fnum {
	for j in 20101..snum {
		if i.str()[3..].u32() <= (fstendnum.u32()) && i.str()[3..].u32() != 00 {
			if j.str()[3..].u32() <= (scdendnum.u32()) && j.str()[3..].u32() != 00 {
				if i + j <= tnum && (i + j).str()[3..].u32() <= trdendnum.u32() && (i + j).str()[3..].u32() != 00 && (j.str()[3..].u32() - i.str()[3..].u32()) <= numdiffrange {
					counter++
					mut res := ("${counter}: ${i} + ${j} == ${i+j}")
					println(res)
					ft = ft + "\n${res}"
				}
			}
		}
	}
}
cb.copy(ft)
println("copied!")

for true {}