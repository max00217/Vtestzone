fn main() {
  num_rows := 10
  mut triangle := [][]int{len:num_rows, init:[]int{len: num_rows}}

  for i in 0..num_rows {
    mut row := []int{len:i+1, init:0}
    row[0] = 1
    row[i] = 1
    for j in 1..i {
      row[j] = triangle[i-1][j-1] + triangle[i-1][j]
    }
    triangle[i] = row
  }
  for row in triangle {
    println(row)
  }
}