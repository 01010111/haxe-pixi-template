// Generated by Haxe 4.0.0+ef18b627e
(function ($global) { "use strict";
function $extend(from, fields) {
	var proto = Object.create(from);
	for (var name in fields) proto[name] = fields[name];
	if( fields.toString !== Object.prototype.toString ) proto.toString = fields.toString;
	return proto;
}
var App = function() {
	var _gthis = this;
	PIXI.Application.call(this,{ width : window.document.documentElement.clientWidth, height : window.document.documentElement.clientHeight, backgroundColor : 0, antialias : true, roundPixels : true, clearBeforeRender : true, forceFXAA : true, powerPreference : "high-performance", autoResize : true, legacy : false, transparent : false});
	zero_utilities_EventBus.listen(function(_) {
		zero_utilities_ECS.tick(_);
		return;
	},"update");
	zero_utilities_EventBus.listen(function(_1) {
		zero_utilities_SyncedSin.update(_1);
		return;
	},"update");
	zero_utilities_EventBus.listen(function(_2) {
		zero_utilities_Timer.update(_2);
		return;
	},"update");
	window.requestAnimationFrame(UpdateManager.update);
	zero_utilities_EventBus.listen(function(_3) {
		_gthis.renderer.resize(_3.width,_3.height);
		return;
	},"resize");
	window.addEventListener("resize",function() {
		zero_utilities_EventBus.dispatch("resize",{ width : window.document.documentElement.clientWidth, height : window.document.documentElement.clientHeight});
		return;
	});
	window.document.body.appendChild(this.view);
	this.create();
};
App.__name__ = true;
App.main = function(start) {
	var load_assets = function() {
		var loader = new PIXI.loaders.Loader();
		loader.add(zero_extensions_ArrayExt.remove_duplicates(App.assets));
		loader.on("complete",function() {
			return App.i = start();
		});
		return loader.load();
	};
	if(App.fonts.length == 0) {
		load_assets();
	} else {
		WebFont.load({ custom : { families : App.fonts, urls : ["include/fonts.css"]}, active : load_assets});
	}
};
App.__super__ = PIXI.Application;
App.prototype = $extend(PIXI.Application.prototype,{
	create: function() {
	}
});
var Game = function() {
	App.call(this);
};
Game.__name__ = true;
Game.main = function() {
	App.assets = [];
	App.fonts = [];
	App.main(function() {
		return new Game();
	});
};
Game.__super__ = App;
Game.prototype = $extend(App.prototype,{
	create: function() {
		console.log("src/Game.hx:16:","hello world");
	}
});
var HxOverrides = function() { };
HxOverrides.__name__ = true;
HxOverrides.remove = function(a,obj) {
	var i = a.indexOf(obj);
	if(i == -1) {
		return false;
	}
	a.splice(i,1);
	return true;
};
HxOverrides.iter = function(a) {
	return { cur : 0, arr : a, hasNext : function() {
		return this.cur < this.arr.length;
	}, next : function() {
		return this.arr[this.cur++];
	}};
};
Math.__name__ = true;
var Std = function() { };
Std.__name__ = true;
Std.string = function(s) {
	return js_Boot.__string_rec(s,"");
};
var UpdateManager = function() { };
UpdateManager.__name__ = true;
UpdateManager.update = function(time) {
	var dt = UpdateManager.get_dt(time);
	zero_utilities_EventBus.dispatch("update",dt);
	window.requestAnimationFrame(UpdateManager.update);
};
UpdateManager.get_dt = function(time) {
	var out = (time - UpdateManager.last) / 1000;
	UpdateManager.last = time;
	return out;
};
var haxe_ds_IntMap = function() {
	this.h = { };
};
haxe_ds_IntMap.__name__ = true;
haxe_ds_IntMap.prototype = {
	get: function(key) {
		return this.h[key];
	}
	,keys: function() {
		var a = [];
		for( var key in this.h ) this.h.hasOwnProperty(key) ? a.push(key | 0) : null;
		return HxOverrides.iter(a);
	}
};
var haxe_ds_ObjectMap = function() {
	this.h = { __keys__ : { }};
};
haxe_ds_ObjectMap.__name__ = true;
haxe_ds_ObjectMap.prototype = {
	get: function(key) {
		return this.h[key.__id__];
	}
	,keys: function() {
		var a = [];
		for( var key in this.h.__keys__ ) {
		if(this.h.hasOwnProperty(key)) {
			a.push(this.h.__keys__[key]);
		}
		}
		return HxOverrides.iter(a);
	}
};
var haxe_ds_StringMap = function() {
	this.h = { };
};
haxe_ds_StringMap.__name__ = true;
haxe_ds_StringMap.prototype = {
	get: function(key) {
		if(__map_reserved[key] != null) {
			return this.getReserved(key);
		}
		return this.h[key];
	}
	,setReserved: function(key,value) {
		if(this.rh == null) {
			this.rh = { };
		}
		this.rh["$" + key] = value;
	}
	,getReserved: function(key) {
		if(this.rh == null) {
			return null;
		} else {
			return this.rh["$" + key];
		}
	}
	,existsReserved: function(key) {
		if(this.rh == null) {
			return false;
		}
		return this.rh.hasOwnProperty("$" + key);
	}
	,keys: function() {
		return HxOverrides.iter(this.arrayKeys());
	}
	,arrayKeys: function() {
		var out = [];
		for( var key in this.h ) {
		if(this.h.hasOwnProperty(key)) {
			out.push(key);
		}
		}
		if(this.rh != null) {
			for( var key in this.rh ) {
			if(key.charCodeAt(0) == 36) {
				out.push(key.substr(1));
			}
			}
		}
		return out;
	}
};
var haxe_iterators_MapKeyValueIterator = function(map) {
	this.map = map;
	this.keys = map.keys();
};
haxe_iterators_MapKeyValueIterator.__name__ = true;
haxe_iterators_MapKeyValueIterator.prototype = {
	hasNext: function() {
		return this.keys.hasNext();
	}
	,next: function() {
		var key = this.keys.next();
		return { value : this.map.get(key), key : key};
	}
};
var js__$Boot_HaxeError = function(val) {
	Error.call(this);
	this.val = val;
	if(Error.captureStackTrace) {
		Error.captureStackTrace(this,js__$Boot_HaxeError);
	}
};
js__$Boot_HaxeError.__name__ = true;
js__$Boot_HaxeError.__super__ = Error;
js__$Boot_HaxeError.prototype = $extend(Error.prototype,{
});
var js_Boot = function() { };
js_Boot.__name__ = true;
js_Boot.__string_rec = function(o,s) {
	if(o == null) {
		return "null";
	}
	if(s.length >= 5) {
		return "<...>";
	}
	var t = typeof(o);
	if(t == "function" && (o.__name__ || o.__ename__)) {
		t = "object";
	}
	switch(t) {
	case "function":
		return "<function>";
	case "object":
		if(((o) instanceof Array)) {
			var str = "[";
			s += "\t";
			var _g3 = 0;
			var _g11 = o.length;
			while(_g3 < _g11) {
				var i = _g3++;
				str += (i > 0 ? "," : "") + js_Boot.__string_rec(o[i],s);
			}
			str += "]";
			return str;
		}
		var tostr;
		try {
			tostr = o.toString;
		} catch( e1 ) {
			var e2 = ((e1) instanceof js__$Boot_HaxeError) ? e1.val : e1;
			return "???";
		}
		if(tostr != null && tostr != Object.toString && typeof(tostr) == "function") {
			var s2 = o.toString();
			if(s2 != "[object Object]") {
				return s2;
			}
		}
		var str1 = "{\n";
		s += "\t";
		var hasp = o.hasOwnProperty != null;
		var k = null;
		for( k in o ) {
		if(hasp && !o.hasOwnProperty(k)) {
			continue;
		}
		if(k == "prototype" || k == "__class__" || k == "__super__" || k == "__interfaces__" || k == "__properties__") {
			continue;
		}
		if(str1.length != 2) {
			str1 += ", \n";
		}
		str1 += s + k + " : " + js_Boot.__string_rec(o[k],s);
		}
		s = s.substring(1);
		str1 += "\n" + s + "}";
		return str1;
	case "string":
		return o;
	default:
		return String(o);
	}
};
var zero_extensions_ArrayExt = function() { };
zero_extensions_ArrayExt.__name__ = true;
zero_extensions_ArrayExt.remove_duplicates = function(arr) {
	var unique = [];
	var _g = 0;
	while(_g < arr.length) {
		var item = arr[_g];
		++_g;
		if(unique.indexOf(item) < 0) {
			unique.push(item);
		}
	}
	arr = unique;
	return arr;
};
var zero_utilities_ECS = function() { };
zero_utilities_ECS.__name__ = true;
zero_utilities_ECS.tick = function(dt) {
	if(dt == null) {
		dt = 0;
	}
	var _g = [];
	var s = zero_utilities_ECS.SYSTEMS.keys();
	while(s.hasNext()) {
		var s1 = s.next();
		_g.push(s1);
	}
	var systems = _g;
	systems.sort(function(s11,s2) {
		if(s11.priority > s2.priority) {
			return -1;
		} else {
			return 1;
		}
	});
	var _g1 = 0;
	while(_g1 < systems.length) {
		var system = systems[_g1];
		++_g1;
		system.update(dt,zero_utilities_ECS.get_matching_entities(zero_utilities_ECS.SYSTEMS.h[system.__id__]));
	}
};
zero_utilities_ECS.get_matching_entities = function(components) {
	var out = [];
	var _g = new haxe_iterators_MapKeyValueIterator(zero_utilities_ECS.ENTITIES);
	while(_g.hasNext()) {
		var _g1 = _g.next();
		var name = _g1.key;
		var id = _g1.value;
		var add = true;
		var _g2 = 0;
		while(_g2 < components.length) {
			var component = components[_g2];
			++_g2;
			var tmp;
			var _this = zero_utilities_ECS.COMPONENTS;
			if(!(!(__map_reserved[component] != null ? _this.existsReserved(component) : _this.h.hasOwnProperty(component)))) {
				var _this1 = zero_utilities_ECS.COMPONENTS;
				tmp = !(__map_reserved[component] != null ? _this1.getReserved(component) : _this1.h[component]).h.hasOwnProperty(id);
			} else {
				tmp = true;
			}
			if(tmp) {
				add = false;
			}
		}
		if(add) {
			out.push(name);
		}
	}
	return out;
};
var zero_utilities_System = function(priority) {
	if(priority == null) {
		priority = 0;
	}
	this.priority = priority;
};
zero_utilities_System.__name__ = true;
zero_utilities_System.prototype = {
	update: function(dt,entities) {
	}
};
var zero_utilities_EventBus = function() { };
zero_utilities_EventBus.__name__ = true;
zero_utilities_EventBus.dispatch = function(name,data) {
	var key = Std.string(name);
	var _this = zero_utilities_EventBus.listeners;
	if(!(__map_reserved[key] != null ? _this.existsReserved(key) : _this.h.hasOwnProperty(key))) {
		return;
	}
	var _g = 0;
	var key1 = Std.string(name);
	var _this1 = zero_utilities_EventBus.listeners;
	var _g1 = __map_reserved[key1] != null ? _this1.getReserved(key1) : _this1.h[key1];
	while(_g < _g1.length) {
		var listener = _g1[_g];
		++_g;
		if(listener != null) {
			listener(data);
		}
	}
};
zero_utilities_EventBus.listen = function(listener,name) {
	var key = Std.string(name);
	var _this = zero_utilities_EventBus.listeners;
	if(!(__map_reserved[key] != null ? _this.existsReserved(key) : _this.h.hasOwnProperty(key))) {
		var key1 = Std.string(name);
		var _this1 = zero_utilities_EventBus.listeners;
		var value = [];
		if(__map_reserved[key1] != null) {
			_this1.setReserved(key1,value);
		} else {
			_this1.h[key1] = value;
		}
	}
	var key2 = Std.string(name);
	var _this2 = zero_utilities_EventBus.listeners;
	(__map_reserved[key2] != null ? _this2.getReserved(key2) : _this2.h[key2]).push(listener);
};
var zero_utilities_SyncedSin = function() { };
zero_utilities_SyncedSin.__name__ = true;
zero_utilities_SyncedSin.update = function(dt) {
	zero_utilities_SyncedSin.counter = (zero_utilities_SyncedSin.counter + dt) % 1;
};
var zero_utilities_Timer = function() {
};
zero_utilities_Timer.__name__ = true;
zero_utilities_Timer.update = function(dt) {
	var _g = 0;
	var _g1 = zero_utilities_Timer.timers;
	while(_g < _g1.length) {
		var timer = _g1[_g];
		++_g;
		timer.run(dt);
	}
};
zero_utilities_Timer.prototype = {
	cancel: function() {
		if(HxOverrides.remove(zero_utilities_Timer.timers,this)) {
			zero_utilities_Timer.pool.push(this);
		}
	}
	,run: function(dt) {
		if(this.paused) {
			return;
		}
		this.elapsed += dt;
		if(this.time - this.elapsed > zero_utilities_Timer.epsilon) {
			return;
		}
		this.fn();
		this.elapsed = 0;
		this.repeat--;
		if(this.repeat != 0) {
			return;
		}
		this.cancel();
	}
};
String.__name__ = true;
Array.__name__ = true;
haxe_ds_ObjectMap.count = 0;
var __map_reserved = {};
Object.defineProperty(js__$Boot_HaxeError.prototype,"message",{ get : function() {
	return String(this.val);
}});
js_Boot.__toStr = ({ }).toString;
App.fonts = [];
App.assets = [];
UpdateManager.last = 0.0;
zero_utilities_ECS.ENTITIES = new haxe_ds_StringMap();
zero_utilities_ECS.COMPONENTS = new haxe_ds_StringMap();
zero_utilities_ECS.SYSTEMS = new haxe_ds_ObjectMap();
zero_utilities_EventBus.listeners = new haxe_ds_StringMap();
zero_utilities_SyncedSin.counter = 0.0;
zero_utilities_Timer.timers = [];
zero_utilities_Timer.pool = [];
zero_utilities_Timer.epsilon = 1e-8;
Game.main();
})({});
