import ascii_img

fn main() {
	img := ascii_img.from_file("logo/actlogo.jpg",
	scale_x: 0.05
	grayscale: false,
	channels: .rgb,
	style: ascii_img.styles["default"]
	) or {err.msg()}

	println(img)
}