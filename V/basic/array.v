struct Langs {
	name string
	year int
}

fn main(){
	mut intarr := [1, 2, 3]//mut is mutable variable 
	mut init_intintarr := []int{len: 10, cap: 10, init: index + 1}
	mut stringarr := ["A", "B", "V"]
	mut init_stringarr := []string{len: 14, cap: 10, init: "V"}

    println("int: $intarr\ninitialized intarray(int): $init_intintarr\nstring: $stringarr\ninitialized intarray(string)$init_stringarr\n")
	
	intarr << 10
	println("intarray after append(number): $intarr\n")
	intarr << [4, 5, 6]
	println("intarray after append(intarray): $intarr\n")
	println("arraylen: ${intarr.len}, arraycap: ${intarr.cap}\n")
	// intarr = [] //this will be make array empty // or []int{} | []string{}

	arfilt := init_intintarr.filter(it % 2 == 0) //can be use in function
	println ("intarray after filter: $arfilt\n")

	println("${intarr[0]}, ${intarr[1]}\n")

	intarr[1] = 7
	println("${intarr[1]}\n")

	println(init_intintarr.any(it % 2 == 0)) // true
	println(init_intintarr.all(it % 2 == 0)) // false
	println("")

	println("sample array: $intarr")
	println(intarr[1..3])
	println(intarr[1..])
	println(intarr[..3]) // also can use with << operator
	
	println(intarr#[-1..]) // Use # to use negative numbers or numbers that exceed an index
	println(intarr#[-1972..1121])

	cloned := intarr[1..4].clone()
	println(cloned)

	mut fnums := [3]int{}
	println(fnums) //[0, 0, 0]
	fnums[0] = 1
	fnums[1] = 10
	fnums[2] = 100
	// fnums[3] = 1000 // this doesn't compile
	println(fnums)
	println(typeof(fnums).name)
	println("")

	fnums2 := [1, 10, 100]!
	anums := fnums[..] // same as `anums := fnums[0..fnums.len]`
	println(anums) // => [1, 10, 100]
	println(typeof(anums).name) // => []int

	println("=====================================")
	println("Somthing about V's array function")

	mut q := [1, 2, 3, 4, 5]
	println(q.repeat(2))
	mut w := q.repeat(2)
	println(w)
	println("")

	q.insert(0, 10)
	println(q)
	println("")

	q.insert(2, [1, 9, 7, 2])
	println(q)
	println("")

	q.prepend(100)
	println(q)
	println("")

	q.prepend([1, 1, 2, 1])
	println(q)
	println("")

	q.trim(4) // 0 ~ 3
	println(q)
	println("")

	q.clear() // == q.trim(0)
	println(q)
	println("")

	mut e := []int{len: 5, cap: 10, init: index}
	println(e)
	println("")
	
	e.delete_many(1, 1) // (start_index, count)
	println(e)
	e.delete_many(1, 2) // (start_index, count)
	println(e)
	println("")

	mut r := []int{len: 7, cap: 10, init: index + 4}
	println(r)
	println("")

	r.delete(2) // index
	println(r)
	println("")
	
	r.delete_last()
	println(r)
	println("")

	println(r.first()) // r[0]
	println(r.last()) // r[r.len - 1]
	println("")

	println(r.pop())// same as ``println(r.last)``
	println(r)      // ``r.delete_last()``
	println("")
	
	println(r.reverse())
	mut t := r.reverse()
	println(t)
	println("")

	t.reverse_in_place()
	println(t)

	println("=====================================")
	
	mut y := ["Lua", "V", "Python", "Kotlin", "JavaScript"]
	println(y)
	println(y.join(", "))
	println(y.join(" and "))
	println(y.join(" or "))
	// https://modules.vlang.io/index.html#array
	println("")

	y.sort()
	println(y.join(", "))

	mut langs := [Langs{"Lua", 1993}, Langs{"V", 2019}, Langs{"Python", 1991}, Langs{"Kotlin", 2011}, Langs{"JavaScript", 1995}]
	println(langs)
	println("")

	langs.sort(a.name < b.name)
	println(langs)
	println("")
	
	langs.sort(a.year < b.year)
	println(langs)

	println("=====================================")

	stringarr << "C"
	println("intarray after append(string): $stringarr")
	println("D" in init_stringarr)//false
	println(stringarr.map(it.to_lower()))
	//or
	lower := stringarr.map(it.to_lower())
	println(lower)

	files := ['pippo.jpg', "V.v", '01.bmp', '_v.txt', 'img_02.jpg', 'img_01.JPG', "init.v", "odp.png", "main.v"]
	filtered1 := files.filter(it#[-4..].to_lower() == '.jpg').map(it.to_upper())
	filtered2 := files.filter(it#[-2..] =='.v')//.map(it.to_upper())

	println(filtered1)
	println(filtered2)

	println("=====================================")

	mut sd := [][]int{len: 2, init: []int{len: 3, init: index * 2}}
	println(sd)
	mut td := [][][]int{len: 2, init: [][]int{len: 3, init: []int{len: 7, init : index % 2}}}
	println(td)
}