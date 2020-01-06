package objects;

import zero.utilities.Vec2;
import pixi.interaction.InteractionEvent;
import zero.utilities.Timer;
import pixi.core.textures.Texture;
import pixi.core.sprites.Sprite;
import pixi.core.text.Text;
import pixi.core.graphics.Graphics;
import pixi.core.display.Container;

class Card extends Container {

	public static var revealed:Bool = false;

	static var suits = [
		'assets/images/heart.png',
		'assets/images/diamond.png',
		'assets/images/spade.png',
		'assets/images/club.png',
		'assets/images/star.png',
	];
	static var textures = [for (suit in suits) Texture.fromImage(suit)];

	var front:Container;
	var back:Container;
	var shadow:Container;
	var text:Text;
	var suit:Sprite;
	var flip_pos:Float = 0;
	var dragging:Bool = false;
	var target:Vec2;
	var cursor_offset:Vec2;
	var last_x:Float;

	public function new(x:Float, y:Float, ?data:CardData) {
		super();
		position.set(x, y);
		target = [x, y];
		last_x = x;
		addChild(make_shadow());
		addChild(make_front());
		addChild(make_back());
		update_flip();
		update_position();
		if (data != null) set_data(data);
		interactive = true;
		buttonMode = true;
		on('pointerdown', (e) -> pick_up(e));
		on('pointermove', (e) -> move(e));
		on('pointerup', (e) -> drop(e));
	}

	function make_shadow():Container {
		shadow = new Container();
		var shadow_graphic = new Graphics();
		shadow_graphic.fill_rect(Color.PICO_8_DARK_BLUE, -CardStyle.width/2, -CardStyle.height/2, CardStyle.width, CardStyle.height, CardStyle.radius);
		shadow.add(shadow_graphic);
		shadow.alpha = 0.25;
		return shadow;
	}

	function make_front():Container {
		front = new Container();
		var front_graphic = new Graphics();
		front_graphic.fill_rect(Color.PICO_8_WHITE, -CardStyle.width/2, -CardStyle.height/2, CardStyle.width, CardStyle.height, CardStyle.radius);
		front_graphic.rect(Color.PICO_8_PEACH, -CardStyle.width/2, -CardStyle.height/2, CardStyle.width, CardStyle.height, CardStyle.radius, 4);
		text = new Text('', TextStyles.CARD_FRONT);
		text.anchor.set(0.5, 0);
		suit = new Sprite(textures[0]);
		suit.anchor.set(0.5, 1);
		suit.scale.set((CardStyle.height/2 / suit.texture.height) * 0.8);
		front.add(front_graphic);
		front.add(text);
		front.add(suit);
		return front;
	}

	function make_back():Container {
		back = new Container();
		var back_graphic = new Graphics();
		back_graphic.fill_rect(Color.PICO_8_BLUE, -CardStyle.width/2, -CardStyle.height/2, CardStyle.width, CardStyle.height, CardStyle.radius);
		back_graphic.rect(Color.PICO_8_INDIGO, -CardStyle.width/2, -CardStyle.height/2, CardStyle.width, CardStyle.height, CardStyle.radius, 4);
		back.add(back_graphic);
		return back;
	}

	function update_flip() {
		((?_) -> {
			flip_pos += ((revealed ? 1 : -1) - flip_pos) * 0.25;
			if (flip_pos > 0.99) flip_pos = 1;
			front.scale.x = flip_pos.abs();
			back.scale.x = flip_pos.abs();
			shadow.scale.x = flip_pos.abs();
			front.alpha = flip_pos > 0 ? 1 : 0;
			back.alpha = flip_pos < 0 ? 1 : 0;
		}).listen('update');
	}

	function update_position() {
		((?_) -> {
			last_x = x;
			x += (target.x - x) * 0.25;
			y += (target.y - y) * 0.25;
			shadow.y += ((dragging ? CardStyle.pickup_height : 0) - shadow.y) * 0.25;
			rotation = (x - last_x) * 0.01;
			shadow.scale.x += ((dragging ? 1.1 : 1) - shadow.scale.x) * 0.25;
			shadow.scale.y += ((dragging ? 1.1 : 1) - shadow.scale.y) * 0.25;
		}).listen('update');
	}

	function pick_up(e:InteractionEvent) {
		dragging = true;
		cursor_offset = [x - e.data.global.x, y - e.data.global.y];
		move(e);
		parent.setChildIndex(this, parent.children.length - 1);
	}

	function move(e:InteractionEvent) {
		if (!dragging) return;
		target = [e.data.global.x + cursor_offset.x, e.data.global.y + cursor_offset.y - CardStyle.pickup_height];
	}

	function drop(e:InteractionEvent) {
		dragging = false;
		target.x = (e.data.global.x + cursor_offset.x);//.snap_to_grid(GridStyle.size);
		target.y = (e.data.global.y + cursor_offset.y);//.snap_to_grid(GridStyle.size);
	}

	public function set_data(data:CardData) {
		text.text = data.text;
		suit.texture = switch (data.suit) {
			case 'hearts': textures[0];
			case 'diamonds': textures[1];
			case 'spades': textures[2];
			case 'clubs': textures[3];
			default: textures[4];
		}
	}

	public function instant_kill() {
		scale.to(0.2, { x: 0, y: 0 });
		Timer.get(0.2, () -> this.destroy(true));
	}

	public function kill() {
		position.to(0.2, { x: 0, y: 0 });
		scale.to(0.2, { x: 0, y: 0, delay: 0.2 });
		Timer.get(0.4, () -> this.destroy(true));
	}

}

typedef CardData = {
	text:String,
	suit:String,
}