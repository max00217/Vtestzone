//start this with ``v run .``
module main

import vweb
import time
import db.sqlite

struct App {
	vweb.Context
pub mut:
	db sqlite.DB
}

fn main() {
	mut app := App{
		db: sqlite.connect(':memory:')!
	}
	sql app.db {
		create table Article
	}!

	first_article := Article{
		title: 'Hello, world!'
		text: 'V is great.'
	}

	second_article := Article{
		title: 'Second post.'
		text: 'Hm... what should I write about?'
	}

	sql app.db {
		insert first_article into Article
		insert second_article into Article
	}!
	vweb.run(app, 1972)
}

["/time"]
fn (mut app App) time() vweb.Result {
  currunttime := time.now().format()
  return $vweb.html()
}

["/index"]
pub fn (app &App) index() vweb.Result {
	articles := app.find_all_articles()
	return $vweb.html()
}

["/main"]
pub fn (mut app App) main1972() vweb.Result {
	msg1 := "Vweb 테스트"
	msg2 := "다른 페이지로 넘어가는 법"
	return $vweb.html()
}