import zero.utilities.Color;
import pixi.core.display.Container;
import zero.utilities.SyncedSin;
import zero.utilities.ECS;
import zero.utilities.Timer;
import webfont.WebFontLoader;
import pixi.loaders.Loader;
import js.Browser;

using zero.extensions.Tools;
using zero.utilities.EventBus;

class App extends pixi.core.Application {

	public static var i:App;
	static var fonts:Array<String> = [];
	static var assets:Array<String> = [];
	static var bg_color:Color = Color.BLACK;

	static function main(start:Void -> App) {
		// Load fonts, then load assets, then start new app
		var load_assets = () -> {
			var loader = new Loader();
			loader.add(assets.remove_duplicates());
			loader.on('complete', () -> start());
			loader.load();
		}
		fonts.length == 0 ? load_assets() : WebFontLoader.load({
			custom: { families: fonts, urls: ['include/fonts.css'] },
			active: load_assets
		});
	}

	public var world:Container;
	public var width:Float;
	public var height:Float;

	public function new() {
		super({
			width: Browser.document.documentElement.clientWidth,
			height: Browser.document.documentElement.clientHeight,
			backgroundColor: bg_color.to_hex_24(),
			antialias: true,
			roundPixels: true,
			clearBeforeRender: true,
			forceFXAA: true,
			powerPreference: 'high-performance',
			autoResize: true,
			legacy: false,
			transparent: false
		});
		i = this;
		width = Browser.document.documentElement.clientWidth;
		height = Browser.document.documentElement.clientHeight;
		// Update
		((?_) -> ECS.tick(_)).listen('update');
		((?_) -> SyncedSin.update(_)).listen('update');
		((?_) -> Timer.update(_)).listen('update');
		update.listen('update');
		Browser.window.requestAnimationFrame(UpdateManager.update);
		// Resize
		((?_) -> renderer.resize(_.width, _.height)).listen('resize');
		Browser.window.addEventListener('resize', () -> 'resize'.dispatch({ width: width = Browser.document.documentElement.clientWidth, height: height = Browser.document.documentElement.clientHeight }));
		// Add view
		Browser.document.body.appendChild(view);
		world = new Container();
		stage.addChild(world);
		create();
	}

	public function create() {
		// Override me!
	}

	public function update(?dt:Float) {
		// Override me!
	}

}
