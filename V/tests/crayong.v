import crayon
//v install thecodrr.crayon - .vmodules에서 thecodrr 삭제, utiles.v에서  c.style.clone()로 변경

println(crayon.new("Hello,", crayon.new(" World").bold().str()).cyan().underline().str())
println(crayon.color("{bold.underline I am bold and underlined} and I am not"))