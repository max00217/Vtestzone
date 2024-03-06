import ascii_img
import os

fn main() {
	img := ascii_img.from_file("logo/actlogo.jpg",
	scale_x: 0.05
	grayscale: false,
	channels: .rgb,
	style: ascii_img.styles["default"]
	) or {err.msg()}

	println(img)
	mut s := os.input("종료하려면 아무 키나 입력...")
}