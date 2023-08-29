fn main() {
	for i in 1..18 {
		println("${163 * i + i} ~ ")
		if 163 * i + i - 1 > 2458 {
			break
		}
	}
}