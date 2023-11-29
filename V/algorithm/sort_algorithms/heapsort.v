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
  heap_sort(mut arr)
  println('After sort: $arr')
}

fn heap_sort(mut data []int) {
  len := data.len
  make_heap(mut data, len)
  
  for end := len - 1; end > 0; end-- {
    data[0], data[end] = data[end], data[0]
    sift_down(mut data, 0, end)
	}
}

fn make_heap(mut data []int, len int) {
  mut start := (len - 2) / 2
  
  for start >= 0 {
    sift_down(mut data, start, len)
    start--
  }
}

fn sift_down(mut data []int, start, end int) {
  mut root := start

  for root * 2 + 1 < end {

    mut child := root * 2 + 1

    if child + 1 < end && data[child] < data[child + 1] {
      child ++
    }
		
    if data[root] < data[child] {
      data[root], data[child] = data[child], data[root]
      	root = child
      } else {
        return
      }
  }
}