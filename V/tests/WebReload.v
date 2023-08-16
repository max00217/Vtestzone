import net.http

fn main() {
    username := "max00217"
    api_token := "6ac4304b6f0de3ac1630e7c13fc02501292847bc"
    domain_name := "max00217.pythonanywhere.com"
    url := "https://www.pythonanywhere.com/api/v0/user/$username/webapps/$domain_name/reload/"

    mut header := http.new_header()
    header.add(.authorization, "Token $api_token")

    // post 메소드 사용
    config := http.FetchConfig{
        method: .post,
        url: url,
        header: header
    }

    response := http.fetch(config) !

    if response.status_code == 200 {
        println("Status code: ${response.status_code}\nPage Reloaded Successfully\nhttp://max00217.pythonanywhere.com/checking")
    } else {
        println("Got Unexpected Status code: ${response.status_code}\n$response.body")
    }
}
