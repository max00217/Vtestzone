import discordwebhook
import os

fn main() {   
    // Replace with your Discord webhook URL
    webhook_url := "https://discord.com/api/webhooks/1151734885283811378/gJftYlq4QoWUQfoGi_KfHxV6QubfywHsKxSHoKlEvHwWdfjyBkSBlP0a2bm3JaQiojR9"

    // Create a message with the content you want to send
	for true {
		msg := os.input("")

		message := discordwebhook.Message{ 
			content: msg,
		}

		resp := discordwebhook.send_message(webhook_url, message) !
		println(resp)
	}
}