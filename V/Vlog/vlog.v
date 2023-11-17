// blog.v
module main

import vweb
import time

struct App {
	vweb.Context
}

fn main() {
	app := App{}
	vweb.run(app, 8081)
}

fn (mut app App) time() vweb.Result {
	return app.text(time.now().format())
}

["/index"]
pub fn (mut app App) index() vweb.Result {
	message := "Vweb 메인 페이지"
	msg2 := "이제 DB를 넣어야 하는"
	return $vweb.html()
}

["/main"]
pub fn (mut app App) main() vweb.Result {
	msg1 := "Vweb 테스트"
	msg2 := "다른 페이지로 넘어가는 법"
	return $vweb.html()
}