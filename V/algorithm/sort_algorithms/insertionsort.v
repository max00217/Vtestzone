import rand

fn main() {
    mut arr := [
        rand.int_in_range(1, 10)!, 
        rand.int_in_range(1, 10)!, 
        rand.int_in_range(1, 10)!, 
        rand.int_in_range(1, 10)!, 
        rand.int_in_range(1, 10)!, 
        rand.int_in_range(1, 10)!, 
        rand.int_in_range(1, 10)!, 
        rand.int_in_range(1, 10)!, 
        rand.int_in_range(1, 10)!,
    ]
    println('Before sort: $arr')
    insertion_sort(mut arr)
    println('After sort: $arr')
}

fn insertion_sort(mut arr []int) {
    for i in 0 .. arr.len {
        mut key := arr[i]
        mut j := i - 1

        for j >= 0 && arr[j] > key {
            arr[j + 1] = arr[j]
            j -= 1
        }
        arr[j + 1] = key
    }
}