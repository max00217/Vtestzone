fn jaccard_similarity(set1 []int, set2 []int) f64 {
	mut jac_union := set1.len + set2.len
  mut intersection := 0

  for i in 0..set1.len {
    if set2.contains(set1[i]) {
      intersection++
      jac_union--
    }
  }

  return f64(intersection) / f64(jac_union)
}

fn main() {
  set1 := [1, 2, 3, 4]
  set2 := [3, 4, 5, 6]
  println(jaccard_similarity(set1, set2))
}