fn main() {
	for i := 1; i <= 9*9; i++ {
		dan := (i - 1) / 9 + 1
		num := (i - 1) % 9 + 1
		println('${dan} x ${num} = ${dan * num}')
		if num == 9 {
			println('')
		}
	}
}