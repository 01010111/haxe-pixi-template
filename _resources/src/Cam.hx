import pixi.core.display.Container;

class Cam {
	public static function dolly(world:Container, x:Float, y:Float) {
		world.position.set(-x, -y);
	}
}