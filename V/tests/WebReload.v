import net.http

fn main() {
    username := "max00217"
    api_token := "a78785211daf50069f3ff1991d862de30bc4b9a5"
    domain_name := "max00217.pythonanywhere.com"
    url := "https://www.pythonanywhere.com/api/v0/user/${username}/webapps/${domain_name}/reload/"

    mut header := http.new_header()
    header.add(.authorization, "Token $api_token")

    response := http.head(url) or {
        eprintln("Failed to reload web: ${err.msg()}")
        return
    }

    if response.status_code == 200 {
        println("Status code: ${response.status_code}\nPage Reloaded Successfully\nhttp://max00217.pythonanywhere.com/checking")
    } else {
        println("Got Unexpected Status code: ${response.status_code}\n$response.body")
    }
}