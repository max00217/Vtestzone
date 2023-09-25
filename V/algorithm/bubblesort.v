import rand

fn main() {
	mut arr := [
		rand.i64_in_range(1, 10)!, 
		rand.i64_in_range(1, 10)!, 
		rand.i64_in_range(1, 10)!, 
		rand.i64_in_range(1, 10)!, 
		rand.i64_in_range(1, 10)!, 
		rand.i64_in_range(1, 10)!, 
		rand.i64_in_range(1, 10)!, 
		rand.i64_in_range(1, 10)!, 
		rand.i64_in_range(1, 10)!,
	]
	println(arr)
	for i in 1..arr.len - 1 {
		for j in 0..arr.len - i -1 {
			if arr[j] > arr[j+1] {
				arr[j], arr[j+1] = arr[j+1], arr[j]
				println("Sorting...:${arr}")
			}
		}
	}
	println("Sort Result: ${arr}")
}	
