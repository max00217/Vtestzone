fn is_munchausen(n int) bool {
    mut sum := 0
    mut num := n 
    for num > 0 {
        digit := num % 10
        sum += pow(digit, digit)
        num /= 10
    }
    return sum == n
}

fn pow(base int, exponent int) int {
    mut result := 1
    for _ in 0..exponent {
        result *= base
    }
    return result
}

fn main() {
    for i in 1..50000000 {
        if is_munchausen(i) {
            println(i)
        }
    }
}
