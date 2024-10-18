module main

import vweb
import os

struct App {
	vweb.Context
}

fn main() {
	vweb.run_at(new_app(), vweb.RunParams{
		port: 8080
	}) or { panic(err) }
}

fn new_app() &App {
	mut app := &App{}
	app.mount_static_folder_at(os.resource_abs_path("."), "/")
	return app
}

@["/"]
pub fn (mut app App) page_test() vweb.Result {
	return $vweb.html()
}

/**from Mina👍*/