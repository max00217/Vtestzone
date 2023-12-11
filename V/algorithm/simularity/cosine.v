import math

fn dot_product(v1 []int, v2 []int) int {
  mut sum := 0
  for i in 0..v1.len {
    sum += v1[i] * v2[i]
  }
  return sum
}

fn magnitude(v []int) f64 {
  mut sum := 0
  for i in 0..v.len {
    sum += v[i] * v[i]
  }
  return math.sqrt(f64(sum))
}

fn cosine_similarity(v1 []int, v2 []int) f64 {
  return f64(dot_product(v1, v2)) / (magnitude(v1) * magnitude(v2))
}

fn main() {
  v1 := [1, 2, 3]
  v2 := [4, 5, 6]
  println(cosine_similarity(v1, v2))
}