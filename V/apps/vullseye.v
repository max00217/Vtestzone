import rand
import math
import os

fn main() {
    mut userpoint := 0
    for _ in 0..5 {
        mut index := rand.intn(99) or { return }

        mut line := '['
        for j in 0..100 {
            if j == index {
                line += '◉'
            } else {
                line += ' '
            }
        }
        line += ']'
        println(line)
        userinput := os.input("Guess the Number: ")
        if userinput == index {
            userpoint += userpoint + 100
        } else if math.abs(userinput - index) < 10 {
            userpoint += userpoint + 90
        }
        println("${index}\n")
        println("Your score")
    }
}