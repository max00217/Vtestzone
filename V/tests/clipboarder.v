import clipboard
import crayon
import os

fn main() {
	println(crayon.color("{green.bold.italic what's on your clipboard? v0.4}\n"))
	for true{
		mut q := clipboard.new()
		mut w := crayon.new(q.get_text()).light_magenta().bold().str()
		if os.input("> Press Enter...\n(Press ctrl + c to End)") == ""{
			println(crayon.color("\n{red ==========}\n\nThis is your clipboard:\n\n$w\n\n{red ==========}\n"))
		}
		q = clipboard.new()
	}	
}