import zero.utilities.Vec2;
import pixi.core.display.DisplayObject;
import pixi.core.display.Container;

class Cam {
	public static function dolly(world:Container, x:Float, y:Float) {
		world.position.set(-x, -y);
	}
	public static function move_to(world:Container, object:DisplayObject, lerp:Float = 1, ?offset:Vec2) {
		var p = {
			x: -object.x + App.i.width/2,
			y: -object.y + App.i.height/2,
		}
		if (offset != null) {
			p.x += offset.x;
			p.y += offset.y;
		}
		world.x += (p.x - world.x) * lerp;
		world.y += (p.y - world.y) * lerp;
	}
}