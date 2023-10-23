fn main() {
	for i in 0..100000 {
		isthirteen(i)
		go etothirteen(i)
	}
}

fn isthirteen(x int) {
	if x == 13 {
		println("$x, This is Thirteen")
	}
}

fn etothirteen(q int) {
	if q % 13 == 0 {
		println("$q, Multiples of 13 ")
	}
}