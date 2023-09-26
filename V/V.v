fn main() {
    mut result := recursion(10)
    println('Result: $result')
}

fn recursion(q int) int {
    mut w := q * q
    if w < 3000 {
        return recursion(w)
    }
    return w
}