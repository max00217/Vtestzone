fn main() {
	fibo(25)
}

fn fibo(n i64) {
	mut r := 0
	mut n1 := 0
	mut n2 := 1

	if n <= 1 {
		println(n)
	} else {
		for _ in 0..n {
			r = n1 + n2
			n1 = n2
			n2 = r
			println(r)
		}
		// println(r)
	}
}