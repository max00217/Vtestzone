fn main() {
    bt := true
	bf := false
    println("Boolean: $bt, $bf")

    i := i8(127)
	ii := i16(32767)
	iii := i32(2147483647)
	qi := int(2147483647)
	iiii := i64(9223372036854775807)
    println("Int: $i, $ii, $iii, $iiii | int size: $qi")

	u := u8(255)
	uu := u16(65535)
    uuu := u32(4294967295)
	uuuu := u64(18446744073709551615)
	println("Unsigned Int: $u, $uu, $uuu, $uuuu")

    f := f32(1.002898)
	ff := f64(1.7976931348623157)
    println("Float: $f, $ff")

    r := "A"//You can use `A`, 'A', or '\u0041'
    println("Rune: $r")

    str := "Hello, V!"
    println("String: $str")
	
    println("Function [greet(${"V"})]: ${greet("V")}")
	println("or [add(1288, 1289849)]: ${add(1288, 1289849)}")
}

fn greet(name string) string {
    return "You can call me ${name}."
}

fn add(x int, y int) int {
	return x + y
}