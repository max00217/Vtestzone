import os
fn main() {
     mut q := os.input("").int()
     mut w := os.input("").int()

    mut arr := []int{len: q, init: index+1}
    mut rarr := []int{}
    for i in 0..q {
        for _ in 0..w-1 {
            arr << arr[0]
            arr.delete(0)
        }
        rarr << arr[0]
        arr.delete(0)
    }
    println(rarr)
}