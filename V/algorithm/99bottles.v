mut bottles :=99

for bottles >= 0 {
	if bottles == 1 {
		println("1 bottle of beer on the wall, 1 bottle of beer.\ntake one down and pass it around, No more bottle of beer on the wall.\n")
	}else if bottles == 0 {
		println("No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n")
	}else{
    	println("$bottles bottles of beer on the wall, $bottles bottles of beer.")
		println("Take one down and pass it around, ${bottles - 1} bottles of beer on the wall.\n")
	}
    bottles = bottles - 1
}
