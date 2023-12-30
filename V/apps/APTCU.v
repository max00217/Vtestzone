import net.http
import net.html
import thecodrr.crayon
import os

fn main() {
    println(crayon.color("{bold.italic.green A program that checks URI v0.1\n}"))
    for true {
        mut q := os.input("Enter the URI... (server, web page, etc.): \n")
        resp := http.get(q) or {
            println("failed to fetch data from the server")
            return
        }

        println(crayon.color("{bold.italic \n\nStatus Code: }"))
        println(crayon.color("{yellow ${resp.status_code} ${resp.status_msg}}"))

        println(crayon.color("{cyan.bold \n========================\n}"))

        println(crayon.color("{bold.italic Header: }"))
        println(crayon.color("{yellow ${resp.header}}"))

        println(crayon.color("{cyan.bold ========================\n}"))

        println(crayon.color("{bold.italic HTML Body: }"))
        println(crayon.color("{yellow ${resp.body}}"))
    }
}
