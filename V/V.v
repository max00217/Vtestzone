fn main() {
    mut sum := 0
    for i in 1..11 {
        if i % 2 == 0 {
            sum += i
        }
    }
    println("The sum of even numbers from 1 to 10 is: $sum")
}
