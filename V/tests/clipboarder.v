import clipboard
import os

fn main() {
	println("what's on your clipboard?\n")
	mut c := clipboard.new()
	for true{
		if os.input("> Press Enter...") == ""{
			println("\n==========\n\nThis is your clipboard: ${c.get_text()}\n\n==========\n")
		}
	}	
}