fn main() {
	mut q := "(()(((()(()()))())))"
	mut stack := []int{}
	mut count := 0

	for i, c in q {
		if c.str() == "(" {
			stack << i
		} else if c.str() == ")" {
			if stack.len > 0 {
				start := stack.pop()
				count += i - start + 1
			}
		}
	}

	println(count)
}