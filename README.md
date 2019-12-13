# PIXI Haxe Template

A quick way to get started using PIXI in Haxe!

Jump into `src/Game.hx` and start coding!

Registered Events:
```haxe
// On Update:
function update_example(dt:Float) {
	// This fires (roughly) 60 times per second!
}
update_example.listen('update');

// On Resize:
function resize_example(size:{ width:Float, height:Float }) {
	// This fires when the window is resized!
}
resize_example.listen('resize');
```