import zero.utilities.Color;
import pixi.core.graphics.Graphics;

class GraphicsTools {
	public static function fill_circle(graphic:Graphics, color:Color, x:Float, y:Float, radius:Float) {
		graphic.beginFill(color.to_hex_24(), color.alpha);
		graphic.drawCircle(x, y, radius);
		graphic.endFill();
	}
	public static function fill_rect(graphic:Graphics, color:Color, x:Float, y:Float, width:Float, height:Float, radius:Float = 0) {
		graphic.beginFill(color.to_hex_24(), color.alpha);
		graphic.drawRoundedRect(x, y, width, height, radius);
		graphic.endFill();
	}
	public static function circle(graphic:Graphics, color:Color, x:Float, y:Float, radius:Float, line_width:Float = 1, alignment:LineAlign = CENTER) {
		graphic.lineStyle(line_width, color.to_hex_24(), color.alpha, cast alignment);
		graphic.drawCircle(x, y, radius);
		graphic.lineStyle();
	}
	public static function rect(graphic:Graphics, color:Color, x:Float, y:Float, width:Float, height:Float, radius:Float = 0, line_width:Float = 1, alignment:LineAlign = CENTER) {
		graphic.lineStyle(line_width, color.to_hex_24(), color.alpha, cast alignment);
		graphic.drawCircle(x, y, radius);
		graphic.lineStyle();
	}
}

enum abstract LineAlign(Float) {
	var INSIDE = 0;
	var CENTER = 0.5;
	var OUTSIDE = 1;
}