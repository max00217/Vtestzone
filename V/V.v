import os
import math

fn main() {
	mut a := os.input("").int()
	mut vact := math.factorial(a)
	println("$a! = $vact")
}