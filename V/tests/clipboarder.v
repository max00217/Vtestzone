import clipboard
import os

fn main() {
	println("what's on your clipboard?\n")
	mut q := clipboard.new()
	mut w := q.get_text()
	for true{
		if os.input("> Press Enter...") == ""{
			println("\n==========\n\nThis is your clipboard: $w\n\n==========\n")
		}
	}	
}