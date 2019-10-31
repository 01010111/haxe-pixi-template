package util;

import js.Browser;
import zero.utilities.Timer;

class UpdateManager {
	static var last = 0.0;
	public static function update(time:Float) {
		var dt = get_dt(time);
		Timer.update(dt);
		Browser.window.requestAnimationFrame(update);
	}
	static function get_dt(time:Float):Float {
		var out = (time - last) / 1000;
		last = time;
		return out;
	}
}