module main

import clipboard
import os

mut counter := 0
mut cb := clipboard.new()
mut ft := ""

fstendclass := os.input("1학년 끝 반: ").str()
fstendnum := os.input("1학년 끝 번호: ").str()

scdendclass := os.input("2학년 끝 반: ").str()
scdendnum := os.input("2학년 끝 번호: ").str()

trdendclass := os.input("3학년 끝 반: ").str()
trdendnum := os.input("3학년 끝 번호: ").str()

numdiffrange := os.input("1, 2학년간 번호 오차 범위: ").int()

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

for true {
	
}