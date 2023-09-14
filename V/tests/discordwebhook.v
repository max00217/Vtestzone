import discordwebhook

fn main() {   
    // Replace with your Discord webhook URL
    webhook_url := "https://discord.com/api/webhooks/1151717371086655518/MaVaoSA7cgLq0G4ADVxtE9k72ALSml1mKFrnuDnt-dMxxrCE430YLRW21Ywyc5Dx9ZYx"

    // Create a message with the content you want to send
    message := discordwebhook.Message{ 
        content: "컴파일해서 채팅용으로 만들어야지",
    }

    resp := discordwebhook.send_message(webhook_url, message) !
    println(resp)
}