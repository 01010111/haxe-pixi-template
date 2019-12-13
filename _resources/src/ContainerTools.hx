import pixi.core.display.DisplayObject;
import pixi.core.display.Container;

class ContainerTools {
	public static function add(object:Container, child:DisplayObject) {
		object.addChild(child);
	}
}