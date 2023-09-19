import math
import os
import crayon

fn main() {
	println(crayon.color("{green.bold.italic Prime Number FINDER v0.4}"))
	for true{
		mut q := os.input(crayon.color("{dim Start Number: }")).int()
		mut w := os.input(crayon.color("{dim End Number: }")).int()
		if typeof(q) != typeof(2) || typeof(w) != typeof(1) {
			println(crayon.color("{red.bold.italic.reverse Please enter a valid integer value.}"))
		}
		print_primes(q, w)typeof(q) != typeof(2)
	}
}

fn is_prime(n int) bool {
	if n < 2 {
		return false
	}

	for i in 2..int(math.sqrt(n))+1 {
		if n % i == 0 {
			return false
		}
	}
	return true
}

fn print_primes(n int, m int) {
	for i in n..m+1 {
		if is_prime(i) {
			println(i)
		}
	}
}
