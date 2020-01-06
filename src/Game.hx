import objects.Card;
import App;

class Game extends App {

	static function main() {
		Keys.init();
		App.assets = [
			'assets/images/club.png',
			'assets/images/diamond.png',
			'assets/images/heart.png',
			'assets/images/spade.png',
			'assets/images/star.png',
		];
		App.fonts = [
			'oduda'
		];
		App.main(() -> new Game());
	}

	override function create() {
		stage.add(new objects.Scene());
		((?_) -> if (Keys.just_pressed(F)) Card.revealed = !Card.revealed).listen('update');
	}

	override function update(?dt:Float) {
		
	}
}