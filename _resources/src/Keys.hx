import js.html.KeyboardEvent;
import js.Browser;

using zero.utilities.EventBus;

class Keys {

	static var state:Map<Key, Bool>;
	static var last:Map<Key, Bool>;
	static var keycodes:Map<Int, Key> = [
		8	=> BACKSPACE,
		9	=> TAB,
		13	=> ENTER,
		16	=> SHIFT,
		17	=> CTRL,
		18	=> ALT,
		19	=> PAUSE_BREAK,
		20	=> CAPS_LOCK,
		27	=> ESCAPE,
		33	=> PAGE_UP,
		34	=> PAGE_DOWN,
		35	=> END,
		36	=> HOME,
		37	=> LEFT_ARROW,
		38	=> UP_ARROW,
		39	=> RIGHT_ARROW,
		40	=> DOWN_ARROW,
		45	=> INSERT,
		46	=> DELETE,
		48	=> ZERO,
		49	=> ONE,
		50	=> TWO,
		51	=> THREE,
		52	=> FOUR,
		53	=> FIVE,
		54	=> SIX,
		55	=> SEVEN,
		56	=> EIGHT,
		57	=> NINE,
		65	=> A,
		66	=> B,
		67	=> C,
		68	=> D,
		69	=> E,
		70	=> F,
		71	=> G,
		72	=> H,
		73	=> I,
		74	=> J,
		75	=> K,
		76	=> L,
		77	=> M,
		78	=> N,
		79	=> O,
		80	=> P,
		81	=> Q,
		82	=> R,
		83	=> S,
		84	=> T,
		85	=> U,
		86	=> V,
		87	=> W,
		88	=> X,
		89	=> Y,
		90	=> Z,
		91	=> LEFT_WINDOW_KEY,
		92	=> RIGHT_WINDOW_KEY,
		93	=> SELECT_KEY,
		96	=> NUMPAD_0,
		97	=> NUMPAD_1,
		98	=> NUMPAD_2,
		99	=> NUMPAD_3,
		100	=> NUMPAD_4,
		101	=> NUMPAD_5,
		102	=> NUMPAD_6,
		103	=> NUMPAD_7,
		104	=> NUMPAD_8,
		105	=> NUMPAD_9,
		106	=> MULTIPLY,
		107	=> ADD,
		109	=> SUBTRACT,
		110	=> DECIMAL_POINT,
		111	=> DIVIDE,
		112	=> F1,
		113	=> F2,
		114	=> F3,
		115	=> F4,
		116	=> F5,
		117	=> F6,
		118	=> F7,
		119	=> F8,
		120	=> F9,
		121	=> F10,
		122	=> F11,
		123	=> F12,
		144	=> NUM_LOCK,
		145	=> SCROLL_LOCK,
		186	=> SEMI_COLON,
		187	=> EQUAL_SIGN,
		188	=> COMMA,
		189	=> DASH,
		190	=> PERIOD,
		191	=> FORWARD_SLASH,
		192	=> GRAVE_ACCENT,
		219	=> OPEN_BRACKET,
		220	=> BACK_SLASH,
		221	=> CLOSE_BRAKET,
		222	=> SINGLE_QUOTE,
	];

	public static function init() {
		state = [for (key in Type.allEnums(Key)) key => false];
		last = [for (key in Type.allEnums(Key)) key => false];
		Browser.document.addEventListener('keydown', (e:KeyboardEvent) -> if (keycodes.exists(e.keyCode)) state.set(keycodes[e.keyCode], true));
		Browser.document.addEventListener('keyup', (e:KeyboardEvent) -> if (keycodes.exists(e.keyCode)) state.set(keycodes[e.keyCode], false));
		((?_) -> for (key => bool in state) last.set(key, bool)).listen('postupdate');
	}

	public static function pressed(key:Key) return state[key];
	public static function just_pressed(key:Key) return state[key] && !last[key];
	public static function just_released(key:Key) return !state[key] && last[key];

}

enum Key {
	BACKSPACE; // 8
	TAB; // 9
	ENTER; // 13
	SHIFT; // 16
	CTRL; // 17
	ALT; // 18
	PAUSE_BREAK; // 19
	CAPS_LOCK; // 20
	ESCAPE; // 27
	PAGE_UP; // 33
	PAGE_DOWN; // 34
	END; // 35
	HOME; // 36
	LEFT_ARROW; // 37
	UP_ARROW; // 38
	RIGHT_ARROW; // 39
	DOWN_ARROW; // 40
	INSERT; // 45
	DELETE; // 46
	ZERO; // 48
	ONE; // 49
	TWO; // 50
	THREE; // 51
	FOUR; // 52
	FIVE; // 53
	SIX; // 54
	SEVEN; // 55
	EIGHT; // 56
	NINE; // 57
	A; // 65
	B; // 66
	C; // 67
	D; // 68
	E; // 69
	F; // 70
	G; // 71
	H; // 72
	I; // 73
	J; // 74
	K; // 75
	L; // 76
	M; // 77
	N; // 78
	O; // 79
	P; // 80
	Q; // 81
	R; // 82
	S; // 83
	T; // 84
	U; // 85
	V; // 86
	W; // 87
	X; // 88
	Y; // 89
	Z; // 90
	LEFT_WINDOW_KEY; // 91
	RIGHT_WINDOW_KEY; // 92
	SELECT_KEY; // 93
	NUMPAD_0; // 96
	NUMPAD_1; // 97
	NUMPAD_2; // 98
	NUMPAD_3; // 99
	NUMPAD_4; // 100
	NUMPAD_5; // 101
	NUMPAD_6; // 102
	NUMPAD_7; // 103
	NUMPAD_8; // 104
	NUMPAD_9; // 105
	MULTIPLY; // 106
	ADD; // 107
	SUBTRACT; // 109
	DECIMAL_POINT; // 110
	DIVIDE; // 111
	F1; // 112
	F2; // 113
	F3; // 114
	F4; // 115
	F5; // 116
	F6; // 117
	F7; // 118
	F8; // 119
	F9; // 120
	F10; // 121
	F11; // 122
	F12; // 123
	NUM_LOCK; // 144
	SCROLL_LOCK; // 145
	SEMI_COLON; // 186
	EQUAL_SIGN; // 187
	COMMA; // 188
	DASH; // 189
	PERIOD; // 190
	FORWARD_SLASH; // 191
	GRAVE_ACCENT; // 192
	OPEN_BRACKET; // 219
	BACK_SLASH; // 220
	CLOSE_BRAKET; // 221
	SINGLE_QUOTE; // 222
}