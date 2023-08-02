import os

fn main(){
	/*
	a := 1
	b := 1972.0
	c := 891723.82346812999
	d := true
	e := "You Can Call me V"
	f := 'V'

	print(a)
	println(": " + typeof(a).name)
	print(b)
	println(": " + typeof(b).name)
	print(c)
	println(": " + typeof(c).name)
	print(d)
	println(": " + typeof(d).name)
	print(e)
	println(": " + typeof(e).name)
	print(f)
	println(": " + typeof(f).name)
	*/

	//println(os.args)


	// println(add(77, 33))
	// println(sub(100, 50))
	// println(stradding("asdf", "433"))

	langs := ["Lua", "V", "Python", "Kotlin", "JavaScript"]

	for lang in langs {
		println("저는 $lang 를! 할 수 있어요")
	}
}

// fn add(x int, y int) int {
// 	return x + y
// }

// fn sub(x int, y int) int {
// 	return x - y
// }

// fn stradding(q string, w string) string{
// 	return q + w
// }