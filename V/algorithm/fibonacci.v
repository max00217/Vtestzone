fn main() {
	fibo(50)
}
// need to fine big integer module
fn fibo(n u64) {
	mut n1 := u64(0) 
	mut n2 := u64(1) 
	println(u64(n1))
	println(u64(n2))

	for _ in 2..n {
		mut r := n1 + n2
		n1 = n2
		n2 = r
		println(u64(r))
	}
}
