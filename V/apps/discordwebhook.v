import discordwebhook
import os

fn main() {   
    // Replace with your Discord webhook URL
		webhook_url := os.input("enter your webhook link: ")

    // Create a message with the content you want to send
	for true {
		msg := os.input("msg: ")

		message := discordwebhook.Message{ 
			content: msg,
		}

		resp := discordwebhook.send_message(webhook_url, message) !
		println(resp)
	}
}