import net.http

struct HeaderConfig {
    key   http.CommonHeader
    value string
}

fn main() {
    username := "max00217"
    api_token := "a78785211daf50069f3ff1991d862de30bc4b9a5"
    domain_name := "max00217.pythonanywhere.com"
    url := "https://www.pythonanywhere.com/api/v0/user/${username}/webapps/${domain_name}/reload/"

    mut headers := http.new_header()
    headers.add(.authorization, "Token $api_token")

    response := http.get(url) or {
        eprintln("Failed to reload webapp: ${err.msg()}")
        return
    }

    if response.status_code == 200 {
        println("Status code: ${response.status_code}\nPage Reloaded Successfully")
    } else {
        println("Unexpected Status code: ${response.status_code}\n$response.body")
    }
}