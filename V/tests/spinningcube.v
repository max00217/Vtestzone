import math

fn main() {
	mut cube_width := 20.0 
	mut width := 160 
	mut height := 44 
	mut z_buffer := []f32{len: width * height, init: 0.0}
	mut buffer := []rune{len: width * height, init: `.`}
	mut background_ascii_code := `.` 
	mut distance_from_cam := 100 
	mut horizontal_offset := 0.0 
	mut k1 := 40.0 

	mut increment_speed := 0.6

	mut a, b, c := 0.0, 0.0, 0.0
	mut x, y, z := 0.0, 0.0, 0.0

	mut ooz := 0.0
	mut xp := 0
	mut yp := 0 
	mut idx := 0 

	println(calx(1, 4, 5))
}

fn calx(i int, j int , k int) f64 {
	mut a, b, c := 0.0, 0.0, 0.0
	return (j * math.cos(a) * math.sin(b) * math.cos(c) - k * math.cos(a) * math.sin(b) * math.cos(c) + j * math.cos(a) * math.sin(c) + k * math.sin(a) * math.sin(c) + i * math.cos(b) * math.cos(c))
}
