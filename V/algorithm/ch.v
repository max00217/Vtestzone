fn main() {
    mut ch := ["🥚", "🐔", "🍗", "🐥", "🐣", "🐤", "🐓"]
    ch.sort()

    for i, v in ch {
        if i > 0 {
           print(", ")
        }
        print("$v")
    }
}
