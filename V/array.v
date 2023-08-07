fn main(){
	mut intarr := [1, 2, 3]//mut is mutable variable 
	mut init_intintarr := []int{len: 10, cap: 10, init: index + 1}
	mut strintarr := ["A", "B", "V"]
	mut init_strintarr := []string{len: 14, cap: 10, init: "V"}
	
    println("int: $intarr\ninitialized intarray(int): $init_intintarr\nstring: $strintarr\ninitialized intarray(string)$init_strintarr\n")
	
	intarr << 10
	println("intarray after append(number): $intarr\n")
	intarr << [4, 5, 6]
	println("intarray after append(intarray): $intarr\n")
	println("arraylen: ${intarr.len}, arraycap: ${intarr.cap}\n")

	strintarr << "C"
	println("intarray after append(string): $strintarr")
	println("D" in init_strintarr)//false
	println("")

	arfilt := init_intintarr.filter(it % 2 == 0)
	println ("intarray after filter: $arfilt\n")

	println("${intarr[0]}, ${intarr[1]}\n")

	intarr[1] = 7
	println("${intarr[1]}\n")
}