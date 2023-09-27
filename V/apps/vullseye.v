import rand
import math
import os
import crayon

fn main() {
	println(crayon.color("{green.bold.italic Vull's Eye v0.1.1}\n"))
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
        println(crayon.color("{red.bold ${line}}"))
        userinput := os.input(crayon.color("{green.italic Guess the Number...: }")).int()
        if userinput == index {
            userpoint = userpoint + 100
            println(crayon.color("{red.bold.italic \n+ 100pts!}"))

        } else if math.abs(userinput - index) < 5 {
            userpoint = userpoint + 95
            println(crayon.color("{yellow.bold \n+ 95pts}"))
        } else if math.abs(userinput - index) < 10 {
            userpoint = userpoint + 90
            println(crayon.color("{green.bold \n+ 90pts}"))

        } else if math.abs(userinput - index) < 15 {
            userpoint = userpoint + 80
            println(crayon.color("{blue.bold \n+ 80pts}"))
        } else if math.abs(userinput - index) < 20 {
            userpoint = userpoint + 70
            println(crayon.color("{cyan.bold \n+ 70pts}"))
        } else if math.abs(userinput - index) < 25 {
            userpoint = userpoint + 55
            println(crayon.color("{white \n+ 55pts}"))
        } else if math.abs(userinput - index) < 30 {
            userpoint = userpoint + 45
            println(crayon.color("{light_gray \n+ 45pts}"))
        } else {
            println(crayon.color("{dark_gray.italic \nThere are no points for you...}"))
        }
        println(crayon.color("{bold Your Score: ${userpoint}pts\n}"))
    }
}