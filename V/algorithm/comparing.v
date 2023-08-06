type CompareType = int | bool | map[string]int | []int

fn main() {
    comparetable := [CompareType(0), CompareType(false), CompareType(map[string]int{}), CompareType([]int{})]

    for i := 0; i < comparetable.len + 1; i++ {
        for j := 0; j < comparetable.len + 1; j++ {
            if i >= comparetable.len || j >= comparetable.len {
                println('')
                continue
            }
            println('${comparetable[i]} == ${comparetable[j]}: ${comparetable[i] == comparetable[j]}')
        }
    }
}
