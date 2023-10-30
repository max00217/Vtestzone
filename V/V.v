fn main() {
    octtobin(1000)
}

fn octtobin(q int) {
    mut w := q
    mut e := ''
    if w == 0 {
        e = '0'
    }
    for w != 0 {
        e += (w % 2).str()
        w = w / 2
    }
    println(e.reverse())
}