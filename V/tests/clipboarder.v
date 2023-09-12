import clipboard
import crayon
import os

fn main() {
	println("what's on your clipboard? v0.3\n")
	mut q := clipboard.new()
	mut w := crayon.new(q.get_text()).light_magenta().str()
	for true{
		if os.input("> Press Enter...") == ""{
			println("\n==========\n\nThis is your clipboard:\n\n $w\n\n==========\n")
		}
	}	
}