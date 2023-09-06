import ascii_img
import time

fn main() {
    for i in 1..6573 {
        img := ascii_img.from_file("V/badapple/ba/frame${i}.jpg",
            scale_x: 0.2,
            scale_y: 0.12,
            grayscale: false,
            channels: .rgba,
            style: ascii_img.styles["default"]
        ) or { err.msg() }

        println("\r${img}")
        // time.sleep(510 * time.millisecond)
    }
}