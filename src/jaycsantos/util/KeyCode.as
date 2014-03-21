package jaycsantos.util 
{
	
	/**
	 * KeyCode class simply presents a static constant list of most if not all standard key codes.
	 */
	public class KeyCode
	{
		//MOUSE HAX
		public static const LMB:int = 1;
		public static const MMB:int = 2;
		public static const RMB:int = 4;
		
		//LETTERS
		public static const A:int = 65;
		public static const B:int = 66;
		public static const C:int = 67;
		public static const D:int = 68;
		public static const E:int = 69;
		public static const F:int = 70;
		public static const G:int = 71;
		public static const H:int = 72;
		public static const I:int = 73;
		public static const J:int = 74;
		public static const K:int = 75;
		public static const L:int = 76;
		public static const M:int = 77;
		public static const N:int = 78;
		public static const O:int = 79;
		public static const P:int = 80;
		public static const Q:int = 81;
		public static const R:int = 82;
		public static const S:int = 83;
		public static const T:int = 84;
		public static const U:int = 85;
		public static const V:int = 86;
		public static const W:int = 87;
		public static const X:int = 88;
		public static const Y:int = 89;
		public static const Z:int = 90;
		
		//NUMBERS
		public static const ZERO:int = 48;
		public static const ONE:int = 49;
		public static const TWO:int = 50;
		public static const THREE:int = 51;
		public static const FOUR:int = 52;
		public static const FIVE:int = 53;
		public static const SIX:int = 54;
		public static const SEVEN:int = 55;
		public static const EIGHT:int = 56;
		public static const NINE:int = 57;
		
		//NUMPAD
		public static const NUMPAD_0:int = 96;
		public static const NUMPAD_1:int = 97;
		public static const NUMPAD_2:int = 98;
		public static const NUMPAD_3:int = 99;
		public static const NUMPAD_4:int = 100;
		public static const NUMPAD_5:int = 101;
		public static const NUMPAD_6:int = 102;
		public static const NUMPAD_7:int = 103;
		public static const NUMPAD_8:int = 104;
		public static const NUMPAD_9:int = 105;
		public static const NUMPAD_MULTIPLY:int = 106;
		public static const NUMPAD_ADD:int = 107;
		public static const NUMPAD_ENTER:int = 108;
		public static const NUMPAD_SUBTRACT:int = 109;
		public static const NUMPAD_DECIMAL:int = 110;
		public static const NUMPAD_DIVIDE:int = 111;
		
		//FUNCTION KEYS
		public static const F1:int = 112;
		public static const F2:int = 113;
		public static const F3:int = 114;
		public static const F4:int = 115;
		public static const F5:int = 116;
		public static const F6:int = 117;
		public static const F7:int = 118;
		public static const F8:int = 119;
		public static const F9:int = 120;
		public static const F10:int = 121;
		public static const F11:int = 122;
		public static const F12:int = 123;
		public static const F13:int = 124;
		public static const F14:int = 125;
		public static const F15:int = 126;
		
		//SYMBOLS
		public static const COLON:int = 186;
		public static const EQUALS:int = 187;
		public static const UNDERSCORE:int = 189;
		public static const QUESTION_MARK:int = 191;
		public static const TILDE:int = 192;
		public static const OPEN_BRACKET:int = 219;
		public static const BACKWARD_SLASH:int = 220;
		public static const CLOSED_BRACKET:int = 221;
		public static const QUOTES:int = 222;
		
		
		//OTHER KEYS		
		public static const BACKSPACE:int = 8;
		public static const TAB:int = 9;
		public static const CLEAR:int = 12;
		public static const ENTER:int = 13;
		public static const SHIFT:int = 16;
		public static const CONTROL:int = 17;
		public static const ALT:int = 18;
		public static const CAPS_LOCK:int = 20;
		public static const ESC:int = 27;
		public static const SPACEBAR:int = 32;
		public static const PAGE_UP:int = 33;
		public static const PAGE_DOWN:int = 34;
		public static const END:int = 35;
		public static const HOME:int = 36;
		public static const LEFT:int = 37;
		public static const UP:int = 38;
		public static const RIGHT:int = 39;
		public static const DOWN:int = 40;
		public static const INSERT:int = 45;
		public static const DELETE:int = 46;
		public static const HELP:int = 47;
		public static const NUM_LOCK:int = 144;
		
		
		public static function getKeyName( keyCode:int ):String
		{
			if ( !_ascii ) {
				_ascii = [];
				_ascii[1] = "LMB";
				_ascii[2] = "MMB";
				_ascii[4] = "RMB";
				_ascii[65] = "A";
				_ascii[66] = "B";
				_ascii[67] = "C";
				_ascii[68] = "D";
				_ascii[69] = "E";
				_ascii[70] = "F";
				_ascii[71] = "G";
				_ascii[72] = "H";
				_ascii[73] = "I";
				_ascii[74] = "J";
				_ascii[75] = "K";
				_ascii[76] = "L";
				_ascii[77] = "M";
				_ascii[78] = "N";
				_ascii[79] = "O";
				_ascii[80] = "P";
				_ascii[81] = "Q";
				_ascii[82] = "R";
				_ascii[83] = "S";
				_ascii[84] = "T";
				_ascii[85] = "U";
				_ascii[86] = "V";
				_ascii[87] = "W";
				_ascii[88] = "X";
				_ascii[89] = "Y";
				_ascii[90] = "Z";
				_ascii[48] = "0";
				_ascii[49] = "1";
				_ascii[50] = "2";
				_ascii[51] = "3";
				_ascii[52] = "4";
				_ascii[53] = "5";
				_ascii[54] = "6";
				_ascii[55] = "7";
				_ascii[56] = "8";
				_ascii[57] = "9";
				_ascii[32] = "Space";
				_ascii[13] = "Enter";
				_ascii[17] = "Ctrl";
				_ascii[16] = "Shift";
				_ascii[192] = "~";
				_ascii[38] = "Up";
				_ascii[40] = "Down";
				_ascii[37] = "Left";
				_ascii[39] = "Right";
				_ascii[96] = "Numpad 0";
				_ascii[97] = "Numpad 1";
				_ascii[98] = "Numpad 2";
				_ascii[99] = "Numpad 3";
				_ascii[100] = "Numpad 4";
				_ascii[101] = "Numpad 5";
				_ascii[102] = "Numpad 6";
				_ascii[103] = "Numpad 7";
				_ascii[104] = "Numpad 8";
				_ascii[105] = "Numpad 9";
				_ascii[111] = "Numpad /";
				_ascii[106] = "Numpad *";
				_ascii[109] = "Numpad -";
				_ascii[107] = "Numpad +";
				_ascii[110] = "Numpad .";
				_ascii[45] = "Insert";
				_ascii[46] = "Delete";
				_ascii[33] = "Page Up";
				_ascii[34] = "Page Down";
				_ascii[35] = "End";
				_ascii[36] = "Home";
				_ascii[112] = "F1";
				_ascii[113] = "F2";
				_ascii[114] = "F3";
				_ascii[115] = "F4";
				_ascii[116] = "F5";
				_ascii[117] = "F6";
				_ascii[118] = "F7";
				_ascii[119] = "F8";
				_ascii[188] = ",";
				_ascii[190] = ".";
				_ascii[186] = ";";
				_ascii[222] = "'";
				_ascii[219] = "[";
				_ascii[221] = "]";
				_ascii[189] = "-";
				_ascii[187] = "+";
				_ascii[220] = "\\";
				_ascii[191] = "/";
				_ascii[9] = "TAB";
				_ascii[8] = "Backspace";
				_ascii[27] = "ESC";
			}
			
			return _ascii[keyCode];
		}
		
			// -- private --
			private static var _ascii:Array;
		
	}

}