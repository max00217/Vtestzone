import time
import net.http

resp := http.get("https://wakatime.com/") or {
    println("failed to fetch data from the server")
    return
}
t := time.unix(resp.body.int())
println(t.format())
