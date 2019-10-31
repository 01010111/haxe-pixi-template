package util;

import pixi.core.display.Container;

class ResizeManager {
	static var map:Map<Container, Void -> Void> = [];
	public static function add(obj:Container, fn:Void -> Void) map.set(obj, fn);
	public static function remove(obj:Container) map.remove(obj);
	public static function resize() for (obj => fn in map) if (obj != null) fn();
}