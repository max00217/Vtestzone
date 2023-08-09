struct Person {
	awake bool
}

fn main() {
	mut me := &Person{awake: true}
	for me.awake {
		me.code()
	}
}
