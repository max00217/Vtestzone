// import os

fn main(){
langs := ["Lua", "V", "Python", "Kotlin", "JavaScript"]
printingsome(langs)
}

fn printingsome(arr []string){
	for lang in arr {
		println("${lang}")
	}
}