import webfont.WebFontLoader;
import pixi.loaders.Loader;
import js.Browser;

class App extends pixi.core.Application {

	public static var i:App;
	static var fonts:Array<String> = [];
	static var images:Array<String> = [];

	static function main() {
		// Load fonts, then load images, then start new app
		var load_images = () -> {
			var loader = new Loader();
			loader.add(images.remove_duplicates());
			loader.on('complete', () -> i = new App());
			loader.load();
		}
		fonts.length == 0 ? load_images() : WebFontLoader.load({
			custom: { families: fonts, urls: ['include/fonts.css'] },
			active: load_images
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
		Browser.window.addEventListener('resize', () -> {
			renderer.resize(Browser.document.documentElement.clientWidth, Browser.document.documentElement.clientHeight);
			util.ResizeManager.resize();
		});
		Browser.document.body.appendChild(view);
		Browser.window.requestAnimationFrame(util.UpdateManager.update);
	}

}
