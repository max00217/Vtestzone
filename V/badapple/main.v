import ascii_img
// import time

fn main() {
    for i in 1..6573 {
        img := ascii_img.from_file("ba/frame${i}.jpg",
            scale_x: 0.4,
            scale_y: 0.15,
            grayscale: false,
            channels: .rgb,
            style: ascii_img.styles["default"]
        ) or { err.msg() }

        println("\r${img}")
        // time.sleep(510 * time.millisecond)
    }
}