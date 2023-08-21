fn main(){
	mut fizzcount := 0
	mut buzzcount := 0
	mut puzzcount := 0
	mut fbcount := 0
	mut fpcount := 0
	mut bpcount := 0
	mut fbpcount :=0
	mut nn := 0

	for i in 1..1972 {
		if i % 3 == 0 && i % 5 == 0 && i % 7 == 0 {
			println("FizzBuzzPuzz")
			fbpcount++
		} else if i % 3 == 0 && i % 5 == 0 {
			println("FizzBuzz")
			fbcount++
		} else if i % 3 == 0 && i % 7 == 0 {
			println("FizzPuzz")
			fpcount++
		} else if i % 5 == 0 && i % 7 == 0 {
			println("BuzzPuzz")
			bpcount++
		} else if i % 3 == 0 {
			println("Fizz")
			fizzcount++
		} else if i % 5 == 0 {
			println("Buzz")
			buzzcount++
		} else if i % 7 == 0 {
			println("Puzz")
			puzzcount++
		} else {
			println(i)
			nn++
		}
	}
	println("\n\n===Result===\n")
	println("Fizz: $fizzcount")
	println("Buzz: $buzzcount")
	println("Puzz: $puzzcount")
	println("FizzBuzz: $fbcount")
	println("BuzzPuzz: $bpcount")
	println("FizzPuzz: $fpcount")
	println("FizzBuzzPuzz: $fbpcount")
	println("Normal Number: $nn")
}