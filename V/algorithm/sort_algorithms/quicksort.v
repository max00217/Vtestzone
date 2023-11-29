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
    
  arr = quick_sort(mut arr)
  println('After sort: $arr')
}

fn quick_sort(mut arr []int) []int {
  if arr.len <= 1 {
    return arr
  }

  pivot := arr[arr.len / 2]
  mut left := []int{}
  mut middle := []int{}
  mut right := []int{}

  for _, item in arr {
    if item < pivot {
      left << item
    } else if item > pivot {
      right << item
    } else {
      middle << item
    }
  }

  mut sorted := quick_sort(mut left)
	sorted << middle
  sorted << quick_sort(mut right)

	println("Left, Middle, Right")
	print(left)
	print(middle)
	println(right)
	println(arr)
	println(sorted)
	println("\n======\n")
  return sorted
}