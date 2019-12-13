import App;

class Game extends App {

	static function main() {
		App.assets = [
			// list assets here!
		];
		App.fonts = [
			// liste font family names here!
		];
		App.main(() -> new Game());
	}

	override function create() {
		trace('hello world');
	}

	override function update(?dt:Float) {
		
	}
}