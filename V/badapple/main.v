module main

import gg
import gx

fn main() {
    mut context := gg.new_context(
        bg_color: gx.rgb(174, 198, 255)
        width: 1200
        height: 800
        window_title: 'tests'
        frame_fn: frame
    )
    context.run()
}

fn frame(mut ctx gg.Context) {
    ctx.begin()
	ctx.cache_image("V/badapple/sample.jpg" Image)
	ctx.create_image("V/badapple/sample.jpg") or {return}
    ctx.draw_convex_poly([f32(100.0), 100.0, 200.0, 100.0, 300.0, 200.0, 200.0, 300.0, 100.0, 129837923.0],
        gx.blue)
    ctx.draw_poly_empty([f32(50.0), 50.0, 70.0, 60.0, 90.0, 80.0, 70.0, 110.0], gx.black)
    ctx.draw_triangle_filled(450, 142, 530, 280, 370, 280, gx.red)
    ctx.end()
}