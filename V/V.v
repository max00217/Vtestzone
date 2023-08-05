import os { input }
import encoding.csv

fn main() {
    file_name := './v.csv' // 파일 경로
	println("읽어들이려는 csv 파일명을 v.csv로 변경해주세요.\n")
	for true{
		mut row_number := os.input("계산을 원하는 행 번호(정지하려면 0을 입력): ").int() // 원하는 행 번호
		if row_number == 0 {
			break
		}
		
		sum := sum_from_eighth_column(file_name, row_number)
		
		if sum == -1 {
			eprintln('Error: Could not read the file or the row number not found')
		} else {
			println('행 번호: $row_number, 값: $sum')
		}
	}
}

fn safe_float_conversion(value string) f64 {
    f := value.f64()
    if f == 0.0 {
        return 0
    }
    return f
}

fn sum_from_eighth_column(file_name string, row_number int) f64 {
    data := os.read_file(file_name) or { return -1 }
    
    data_ascii := string(data)
    
    mut parser := csv.new_reader(data_ascii)
    
    mut row_count := 0
    for {
        items := parser.read() or { break }
        row_count++
        if row_count == row_number {
            values := items[7..]
            mut value_sum := 0.0
            for value in values {
                value_sum += safe_float_conversion(value)
            }
            return value_sum
        }
    }
    return -1
}
