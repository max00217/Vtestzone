import math

fn calx(i int, j int , k int) f64 {
	mut a, b, c := 0.0, 0.0, 0.0
	return (j * math.cos(a) * math.sin(b) * math.cos(c) - k * math.cos(a) * math.sin(b) * math.cos(c) + j * math.cos(a) * math.sin(c) + k * math.sin(a) * math.sin(c) + i * math.cos(b) * math.cos(c))
}

fn caly(i int, j int , k int) f64 {
	mut a, b, c := 0.0, 0.0, 0.0
	return (j * math.cos(a) * math.cos(c) + k * math.sin(a) * math.cos(c) - j * math.sin(a) * math.sin(b) * math.sin(c) + k * math.cos(a) * math.sin(b) * math.sin(C) - i * math.cos(b) * math.sin(c))
}

fn calz(i int, j int , k int) f64 {
	mut a, b, c := 0.0, 0.0, 0.0
  return (k * math.cos(a) * math.cos(b) - j * math.sin(a) * math.cos(b) + i * math.sin(b))
}

fn calcforsurface(cubeX f64, cubeY f64, cubeZ f64, ch int) f64 {
	mut width := 160 
	mut height := 44

	mut distance_from_cam := 100
	mut k1 := 40.0
	mut horizontal_offset := 0.0

	mut z_buffer := []f32{len: width * height, init: 0.0}
	mut buffer := []rune{len: width * height, init: `.`}

	mut x := calculateX(cubeX, cubeY, cubeZ)
  mut y := calculateY(cubeX, cubeY, cubeZ)
  mut z := calculateZ(cubeX, cubeY, cubeZ)

	mut ooz := 1 / z
	
  mut xp = (width / 2 + horizontalOffset + k1 * ooz * x * 2);
  mut yp = (height / 2 + k1 * ooz * y);

	mut idx = xp + yp * width
	if (idx >= 0 && idx < width * height){
	 if (ooz > z_buffer[idx]) {
		z_buffer[idx] = ooz
		buffer[idx] = ch
	}
}

fn main() {
	for true {
		memset
	}
}