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

['/index']
pub fn (mut app App) index() vweb.Result {
	message := '기함수'
	msg2 := "우함수"
	return $vweb.html()
}