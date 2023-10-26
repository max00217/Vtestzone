module main

import vweb
import os

struct App {
	vweb.Context
}
//
struct Object {
	title       string
	description string
	subtext string
}

fn main() {
	vweb.run_at(new_app(), vweb.RunParams{
		port: 8081
	}) or { panic(err) }
}

fn new_app() &App {
	mut app := &App{}
	// makes all static files available.
	app.mount_static_folder_at(os.resource_abs_path('.'), '/')
	return app
}

['/']
pub fn (mut app App) page_home() vweb.Result {
	// all this constants can be accessed by src/templates/page/home.html file.
	page_title := 'V is the new V'
	v_url := 'https://github.com/vlang/v'

	list_of_object := [
		Object{
			title: 'One good title'
			description: 'this is the first'
		},
		Object{
			title: 'Other good title'
			description: 'more one'
		},
	]
	// $vweb.html() in `<folder>_<name> vweb.Result ()` like this
	// render the `<name>.html` in folder `./templates/<folder>`
	return $vweb.html()
}

['/next']
pub fn (mut app App) page_next() vweb.Result {
	this_is_title := "Next V Page"
	v_url := "https://www.youtube.com"

	this_is := "V"

	next_object := [
		Object{
			title: "Youtube"
			subtext: "V로 웹 사이트 만들 건데 이거 한국어 지원합니까"
			gotonext : "/next"

		}
	]

	return $vweb.html()
}