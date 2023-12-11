import math

fn manhattan_distance(v1 []int, v2 []int) int {
  mut sum := 0
  for i in 0..v1.len {
    sum += math.abs(v1[i] - v2[i])
  }
  return sum
}

fn manhattan_similarity(v1 []int, v2 []int) f64 {
  return 1 / (1 + f64(manhattan_distance(v1, v2)))
}

fn main() {
  v1 := [1, 2, 3]
  v2 := [4, 5, 6]
  println(manhattan_similarity(v1, v2))
}