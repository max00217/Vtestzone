import os
import crayon

fn main() {
    println(crayon.color("{green.bold.italic 이진수 변환기 v0.2}\n\n"))
    for true {

        mut p := os.input("이진수로 변환하려는 십진수를 입력하세요: ").int()
        println("\n\n이진수 출력 결과: ${octtobin(p)}")
        println("JTJ 출력 결과: ${bintojtj(octtobin(p))}\n")
    }
}

fn octtobin(q int) string {
    mut w := q
    mut e := ""
    if w == 0 {
        e = "0"
    }
    for w != 0 {
        e += (w % 2).str()
        w = w / 2
    }

    return e.reverse()
}

fn bintojtj(q string) string {
    mut w := ""
    for e in 0..q.len {
        if q[e]-48 == 0 {
            w += "J"
        } else {
            w += "T"
        }
    }
    return w
}