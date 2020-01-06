package util;

import pixi.core.text.DefaultStyle;

class TextStyles {
	public static var CARD_FRONT:DefaultStyle = {
		fontFamily: 'oduda',
		fill: Color.PICO_8_DARK_BLUE.to_hex_24(),
		fontSize: 18,
		wordWrap: true,
		wordWrapWidth: CardStyle.width - 32,
	}
}

class CardStyle {
	public static var width:Float = 128;
	public static var height:Float = 160;
	public static var radius:Float = 16;
	public static var pickup_height:Float = 24;
}

class GridStyle {
	public static var size:Float = 32;
}