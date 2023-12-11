fn jaccard_similarity(v1 []int, v2 []int) f64 {
	mut jac_union := v1.len + v2.len
  mut intersection := 0

  for i in 0..v1.len {
    if v2.contains(v1[i]) {
      intersection++
      jac_union--
    }
  }

  return f64(intersection) / f64(jac_union)
}

fn main() {
  v1 := [1,1,0,1,1,2,1,0,1,1]
  v2 := [0,0,0,0,0,0,0,0,1,0]
  println(jaccard_similarity(v1, v2))
}