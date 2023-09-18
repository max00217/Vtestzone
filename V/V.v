fn main() {
	mut day := ["M", "T", "W", "H", "F"]
	mut time := ["l", "f", "d", "s", "t"]
	mut room := ["1", "2", "3", "4"]

	for i in 0..day.len {
		for j in 0..time.len {
			for k in 0..room.len {
				println("${day[i]}${time[j]}${room[k]}")
			}
		}
	}
}

