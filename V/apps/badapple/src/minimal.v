import ascii_img
// import time

fn main() {
    for i in 1..6573 {
        img := ascii_img.from_file("../ba/frame${i}.jpg",
            scale_x: 0.36,
            scale_y: 0.18,
            grayscale: false,
            channels: .rgb,
            style: ascii_img.styles["minimal"]
        ) or { err.msg() }

        println("\r${img}")
        // time.sleep(510 * time.millisecond)
    }
}