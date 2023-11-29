import rand

fn main() {
  mut arr := [
    rand.int_in_range(1, 20)!, 
    rand.int_in_range(1, 20)!, 
    rand.int_in_range(1, 20)!,
    rand.int_in_range(1, 20)!, 
    rand.int_in_range(1, 20)!,
    rand.int_in_range(1, 20)!, 
    rand.int_in_range(1, 20)!,
    rand.int_in_range(1, 20)!, 
    rand.int_in_range(1, 20)!,
    rand.int_in_range(1, 20)!, 
    rand.int_in_range(1, 20)!,
    rand.int_in_range(1, 20)!, 
    rand.int_in_range(1, 20)!,
  ]
  println('Before sort: $arr')
  hybrid_sort(mut arr, 0, arr.len - 1)
  println('After sort: $arr')
}

fn hybrid_sort(mut arr []int, low int, high int) {
  if high - low < 10 {
    println('Selection sort on: $arr')
    selection_sort(mut arr, low, high)
    println('After selection sort: $arr')
  } else {
    pivot_index := partition(mut arr, low, high)
    println('Quick sort on: $arr')
    if low < pivot_index - 1 { hybrid_sort(mut arr, low, pivot_index - 1) }
    if pivot_index < high { hybrid_sort(mut arr, pivot_index, high) }
  }
}

fn selection_sort(mut arr []int, low int, high int) {
  for i := low; i <= high; i++ {
    mut min_index := i
    for j := i+1; j <= high; j++ {
      if arr[j] < arr[min_index] {
        min_index = j
        }
      }
    arr[i], arr[min_index] = arr[min_index], arr[i]
    println("Sorting...:${arr}")
  }
}

fn partition(mut arr []int, low int, high int) int {
  pivot := arr[(low + high) / 2]
  mut i := low
  mut j := high
  for {
    for arr[i] < pivot { i++ }
    for arr[j] > pivot { j-- }
    if i <= j {
      arr[i], arr[j] = arr[j], arr[i]
      println("Sorting...:${arr}")
      i++
      j--
    } else {
      return i
    }
  }
  return i
}