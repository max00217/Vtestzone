import ascii_img
// import time

fn main() {
    for i in 1..2122 {
        img := ascii_img.from_file("./frames/rickroll-${i}.jpg",
            scale_x: 0.16,
            scale_y: 0.06,
            grayscale: false,
            channels: .rgb,
            style: ascii_img.styles["default"]
        ) or { err.msg() }

        println("\r${img}")
        // time.sleep(510 * time.millisecond)
    }
}