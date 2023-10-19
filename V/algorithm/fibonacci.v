import math.big

fn main() {
	fibo(1000)
}

fn fibo(n u64) {
	mut n1 := big.integer_from_int(0) 
	mut n2 := big.integer_from_int(1) 
	println(n1)
	println(n2)

	for _ in 2..n {
		mut r := n1 + n2
		n1 = n2
		n2 = r
		println(r)
	}
}
