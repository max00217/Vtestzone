import clipboard

fn main() {
	mut c := clipboard.new()
	println(c.get_text())
}