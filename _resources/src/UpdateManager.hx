import js.Browser;

using zero.utilities.EventBus;

class UpdateManager {
	static var last = 0.0;
	public static function update(time:Float) {
		var dt = get_dt(time);
		'update'.dispatch(dt);
		'postupdate'.dispatch(dt);
		Browser.window.requestAnimationFrame(update);
	}
	static function get_dt(time:Float):Float {
		var out = (time - last) / 1000;
		last = time;
		return out;
	}
}