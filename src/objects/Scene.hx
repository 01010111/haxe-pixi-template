package objects;

import pixi.core.display.Container;

class Scene extends Container {

	public static var i:Scene;

	public function new() {
		super();
		i = this;

		this.add(new Card(256, 256, { text: 'Hello my wonderful friends', suit: 'hearts' }));
		this.add(new Card(320, 320, { text: 'Hello my wonderful friends', suit: 'clubs' }));
	}

}