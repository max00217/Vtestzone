import discordwebhook
import ascii_img
import os

fn main() {   
    webhook_url := "wh"

	for i in 1..6573 {
		img := ascii_img.from_file("../ba/frame${i}.jpg",
			scale_x: 0.36,
			scale_y: 0.18,
			grayscale: false,
			channels: .rgb,
			style: ascii_img.styles["default"]
		) or { err.msg() }

		message := discordwebhook.Message{ 
			content: img,
		}
		// println(img)
		resp := discordwebhook.send_message(webhook_url, message) !
		println(resp)
	}

}