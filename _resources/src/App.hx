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

	static function main(start:Void -> App) {
		// Load fonts, then load assets, then start new app
		var load_assets = () -> {
			var loader = new Loader();
			loader.add(assets.remove_duplicates());
			loader.on('complete', () -> i = start());
			loader.load();
		}
		fonts.length == 0 ? load_assets() : WebFontLoader.load({
			custom: { families: fonts, urls: ['include/fonts.css'] },
			active: load_assets
		});
	}

	public function new() {
		super({
			width: Browser.document.documentElement.clientWidth,
			height: Browser.document.documentElement.clientHeight,
			backgroundColor: 0x000000,
			antialias: true,
			roundPixels: true,
			clearBeforeRender: true,
			forceFXAA: true,
			powerPreference: 'high-performance',
			autoResize: true,
			legacy: false,
			transparent: false
		});
		// Update
		((?_) -> ECS.tick(_)).listen('update');
		((?_) -> SyncedSin.update(_)).listen('update');
		((?_) -> Timer.update(_)).listen('update');
		Browser.window.requestAnimationFrame(UpdateManager.update);
		// Resize
		((?_) -> renderer.resize(_.width, _.height)).listen('resize');
		Browser.window.addEventListener('resize', () -> 'resize'.dispatch({ width: Browser.document.documentElement.clientWidth, height: Browser.document.documentElement.clientHeight }));
		// Add view
		Browser.document.body.appendChild(view);
		create();
	}

	public function create() {
		// Override me!
	}

}
