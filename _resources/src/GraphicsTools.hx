import zero.utilities.Color;
import zero.utilities.Vec2;
import pixi.core.graphics.Graphics;

class GraphicsTools {
	public static function fill_circle(graphic:Graphics, color:Color, x:Float, y:Float, radius:Float):Graphics {
		graphic.beginFill(color.to_hex_24(), color.alpha);
		graphic.drawCircle(x, y, radius);
		graphic.endFill();
		return graphic;
	}
	public static function fill_rect(graphic:Graphics, color:Color, x:Float, y:Float, width:Float, height:Float, radius:Float = 0):Graphics {
		graphic.beginFill(color.to_hex_24(), color.alpha);
		graphic.drawRoundedRect(x, y, width, height, radius);
		graphic.endFill();
		return graphic;
	}
	public static function fill_poly(graphic:Graphics, color:Color, path:Array<Vec2>):Graphics {
		graphic.beginFill(color.to_hex_24(), color.alpha);
		var _path = [];
		for (v in path) {
			_path.push(v.x);
			_path.push(v.y);
		}
		graphic.drawPolygon(_path);
		graphic.endFill();
		return graphic;
	}
	public static function circle(graphic:Graphics, color:Color, x:Float, y:Float, radius:Float, line_width:Float = 1, alignment:LineAlign = CENTER):Graphics {
		graphic.lineStyle(line_width, color.to_hex_24(), color.alpha, cast alignment);
		graphic.drawCircle(x, y, radius);
		graphic.lineStyle();
		return graphic;
	}
	public static function rect(graphic:Graphics, color:Color, x:Float, y:Float, width:Float, height:Float, radius:Float = 0, line_width:Float = 1, alignment:LineAlign = CENTER):Graphics {
		graphic.lineStyle(line_width, color.to_hex_24(), color.alpha, cast alignment);
		graphic.drawCircle(x, y, radius);
		graphic.lineStyle();
		return graphic;
	}
	public static function poly(graphic:Graphics, color:Color, path:Array<Vec2>,line_width:Float = 1, alignment:LineAlign = CENTER):Graphics {
		graphic.lineStyle(line_width, color.to_hex_24(), color.alpha, cast alignment);
		var _path = [];
		for (v in path) {
			_path.push(v.x);
			_path.push(v.y);
		}
		graphic.drawPolygon(_path);
		graphic.lineStyle();
		return graphic;
	}
	public static function line(graphic:Graphics, color:Color, p0x:Float, p0y:Float, p1x:Float, p1y:Float, thickness:Float = 1, alignment:LineAlign = CENTER) {
		graphic.lineStyle(thickness, color.to_hex_24(), color.alpha, cast alignment);
		graphic.moveTo(p0x, p0y);
		graphic.lineTo(p1x, p1y);
		graphic.lineStyle();
		return graphic;
	}
}

enum abstract LineAlign(Float) {
	var INSIDE = 0;
	var CENTER = 0.5;
	var OUTSIDE = 1;
}