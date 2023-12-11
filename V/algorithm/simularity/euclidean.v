import math

fn euclidean_distance(v1 []int, v2 []int) f64 {
  mut sum := 0
  for i in 0..v1.len {
    sum += (v1[i] - v2[i]) * (v1[i] - v2[i])
  }
  return math.sqrt(f64(sum))
}

fn euclidean_similarity(v1 []int, v2 []int) f64 {
  return 1 / (1 + euclidean_distance(v1, v2))
}

fn main() {
  v1 := [1,1,0,1,1,2,1,0,1,1]
  v2 := [0,0,0,0,0,0,0,0,1,0]
  println(euclidean_similarity(v1, v2))
}