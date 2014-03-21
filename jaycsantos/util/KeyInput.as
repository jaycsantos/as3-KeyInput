package jaycsantos.util 
{
	import flash.display.DisplayObject;
	import flash.display.InteractiveObject;
	import flash.display.Stage;
	import flash.events.ContextMenuEvent;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.ContextMenu;
	
	/**
	 * KeyInput class handles all key input with respect to the stage.
	 * Captures keyboard and mouse down, press and release.
	 */
	public class KeyInput
	{
		public var mouseDetected:Boolean;
		public var focused:Boolean;
		
		/** The mouse event target on same frame, clears on update */
		public var mouseTarget:Object
		
		/** The last key code that was processed */
		public var lastKeyCode:uint;
		
		
		private var stage:Stage;
		private var actions:Object;
		private var keyState:Vector.<int>;
		
		
		/**
		 * Constructor
		 * @param	xobj An interactive display object that is already 
		 * added to the stage. Must have stage property set.
		 */
		public function KeyInput( xobj:InteractiveObject ) 
		{
			actions = { };
			keyState = new Vector.<int>(255, true);
			focused = true;
			
			stage = xobj.stage;
			xobj.addEventListener( Event.ENTER_FRAME, _update, false, -1 );
			
			stage.addEventListener( KeyboardEvent.KEY_DOWN, _keyDown );
			stage.addEventListener( KeyboardEvent.KEY_UP, _keyUp );
			stage.addEventListener( MouseEvent.MOUSE_DOWN, _mouseDown );
			stage.addEventListener( MouseEvent.MOUSE_UP, _mouseUp );
			
			if ( "RIGHT_MOUSE_DOWN" in MouseEvent ) {
				stage.addEventListener( "middleMouseDown", _mouseDown );
				stage.addEventListener( "middleMouseUp", _mouseUp );
				stage.addEventListener( "rightMouseDown", _mouseDown );
				stage.addEventListener( "rightMouseUp", _mouseUp );
			}
			
			stage.addEventListener( Event.ACTIVATE, _active );
			stage.addEventListener( Event.DEACTIVATE, _inactive );
			
			var context:ContextMenu = new ContextMenu();
			context.hideBuiltInItems();
			context.addEventListener( ContextMenuEvent.MENU_SELECT, _inactive );
			xobj.contextMenu = context;
		}
		
		/**
		 * Updates the states of key codes every frame
		 * @param	e enterframe event
		 */
		private function _update( e:Event ):void
		{
			// update pressed key
			for ( var k:String in keyState )
				if ( keyState[k] != 0 )
					keyState[k]++;
			
			mouseTarget = null;
		}
		
		/**
		 * Defines a new control scheme input.
		 * @param	name String to map the input to.
		 * @param	keys The keys to use for the Input.
		 */
		public function define( name:String, ...keys ):void
		{
			if ( keys.length == 1 && (keys[0] is Array || keys[0] is Vector.<*> || keys[0] is Vector.<int> || keys[0] is Vector.<uint>) )
				actions[name] = Vector.<int>( keys[0] );
			else
				actions[name] = Vector.<int>( keys );
		}
		
		/** 
		 * Check if key is pressed down
		 * @param	input string/uint An input name or keyCode. */
		public function isDown( input:* ):Boolean
		{
			if ( input is String ) {
				if ( ! actions[input] )
					return false;
				
				for each( var c:int in actions[input] )
					if ( keyState[c] > 0 )
						return true;
				
			} else
			if ( input is int ) {
				return keyState[ int(input) ] > 0;
			}
			
			return false;
		}
		
		/** 
		 * Check if key was just pressed down, single instance
		 * @param	input string/uint An input name or keyCode. */
		public function isPressed( input:* ):Boolean
		{
			if ( input is String ) {
				if ( ! actions[input] )
					return false;
				
				for each( var c:int in actions[input] )
					if ( keyState[c] == 1 )
						return true;
				
			} else
			if ( input is int ) {
				return keyState[ int(input) ] == 1;
			}
			
			return false;
		}
		
		/** 
		 * Check if key was just released, single instance
		 * @param	input string/uint An input name or keyCode. */
		public function isReleased( input:* ):Boolean
		{
			if ( input is String ) {
				if ( ! actions[input] )
					return false;
				
				for each( var c:int in actions[input] )
					if ( keyState[c] == -1 )
						return true;
				
			} else
			if ( input is int ) {
				return keyState[ int(input) ] == -1;
			}
			
			return false;
		}
		
		
		
		private function _keyDown( e:KeyboardEvent ):void
		{
			lastKeyCode = e.keyCode;
			keyState[ lastKeyCode ] = Math.max( keyState[lastKeyCode], 1 );
		}
		private function _keyUp( e:KeyboardEvent ):void
		{
			keyState[ e.keyCode ] = -1;
		}
		
		private function _mouseDown( e:MouseEvent ):void
		{
			switch( e.type ) {
				//case MouseEvent.MIDDLE_MOUSE_DOWN:
				case "middleMouseDown":
					lastKeyCode = KeyCode.MMB; break;
				//case MouseEvent.RIGHT_MOUSE_DOWN:
				case "rightMouseDown":
					lastKeyCode = KeyCode.RMB; break;
				case MouseEvent.MOUSE_DOWN:
				default:
					lastKeyCode = KeyCode.LMB; break;
			}
			keyState[ lastKeyCode ] = Math.max( keyState[lastKeyCode], 1 );
		}
		private function _mouseUp( e:MouseEvent ):void
		{
			var keyCode:uint;
			switch( e.type ) {
				//case MouseEvent.MIDDLE_MOUSE_DOWN:
				case "middleMouseUp":
					keyCode = KeyCode.MMB; break;
				//case MouseEvent.RIGHT_MOUSE_DOWN:
				case "rightMouseUp":
					keyCode = KeyCode.RMB; break;
				case MouseEvent.MOUSE_UP:
				default:
					keyCode = KeyCode.LMB; break;
			}
			keyState[ keyCode ] = -1;
		}
		
		private function _active( e:Event ):void
		{
			focused = true;
		}
		private function _inactive( e:Event ):void
		{
			focused = false;
			
			// clear keystates
			for ( var k:String in keyState )
				if ( keyState[k] > 0 )
					keyState[k] = -1; // set to just released
		}
		
		
	}

}