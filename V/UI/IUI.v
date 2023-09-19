import iui as ui

fn main() {
	mut window := ui.Window.new(
		title: 'My App'
		width: 640
		height: 480
	)

	mut btn := ui.Button.new(text: 'My Button')
	btn.subscribe_event('mouse_up', on_click_event)

	window.add_child(btn)
	window.gg.run()
}

fn on_click_event(mut e ui.MouseEvent) {
	println('Button clicked!')
}