import rand
import arrays

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
	println(arr)
	for i in 0..arr.len - 1 { 
		for _ in i..arr.len - 1 {
			mut q := arrays.idx_min(arr[i..])! + i
			println("Min Value index: ${q},(Value:${arr[q]})\n")

			arr[q] , arr[i] = arr[i], arr[q]
			println("Sorting...:${arr}")
		}
	}
	println("\nSort Result: ${arr}")
}	