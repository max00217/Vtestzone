import math
import os

fn main() {
	println("Prime Number FINDER v0.2.1")
	for true{
		mut q := os.input("Number: ").int()
		if typeof(q) != typeof(2) {
			println("Please enter a valid integer value.")
		}
		print_primes(q)
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

fn print_primes(n int) {
	for i in 1..n+1 {
		if is_prime(i) {
			println(i)
		}
	}
}
