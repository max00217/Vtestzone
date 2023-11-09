fn main() {
	q := 10

	for i in 0..q {
		for _ in 0..(q - i) {
			print(" ")
		}
		for _ in 0..(2 * i -1){
			print("*")
		}
		println(" ")
	}
}