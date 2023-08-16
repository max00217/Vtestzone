import net.http
import os
import time
import term

fn print_loading_animation() {
    mut loading_animation := ['|', '/', '-', '\\']
    mut index := 0

    for {
        if index >= loading_animation.len { index = 0 }
        print("\r${loading_animation[index]}     Please Wait...")
        index++
        time.sleep(130 * time.millisecond)
    }
}

fn main() {
    println("Multi-room Reserv Web Reloader v1.0\nBuilt with V Programming Language\n\n")
    username := "max00217"
    api_token := "6ac4304b6f0de3ac1630e7c13fc02501292847bc"
    domain_name := "max00217.pythonanywhere.com"
    url := "https://www.pythonanywhere.com/api/v0/user/$username/webapps/$domain_name/reload/"

    mut header := http.new_header()
    header.add(.authorization, "Token $api_token")

    if os.input("Press Return(Enter) to Start Reloading...") == "" {
        go print_loading_animation()
        
        config := http.FetchConfig{
            method: .post,
            url: url,
            header: header
        }

        response := http.fetch(config) !

        if response.status_code == 200 {
            for _ in 0..3{term.clear_previous_line()}
            println("\n\nStatus code: ${response.status_code}\nPage Reloaded Complete\nhttp://max00217.pythonanywhere.com/checking")
        } else {
            println("Got Unexpected Status code: ${response.status_code}\n$response.body")
        }

        println("\n\n\nPress any Key to Exit...")
        os.input("")
    }
}
