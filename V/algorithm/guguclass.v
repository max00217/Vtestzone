fn main() {
	fnum := 9
	lnum := 9
	for i := 1; i <= lnum*fnum; i++ {
		dan := (i - 1) / lnum + 1
		num := (i - 1) % lnum + 1
		println('${dan} x ${num} = ${dan * num}')
		if num == lnum {
			println('')
		}
	}
}