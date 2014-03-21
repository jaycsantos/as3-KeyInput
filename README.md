# as3-KeyInput

AS3 input handler with optional action names


### Usage

initialize (`this` is likely your Main displayobject)
```actionscript
var input:KeyInput = new KeyInput( this );
```

test for key inputs
```actionscript
input.isDown( KeyCode.LEFT );
input.isDown( KeyCode.RIGHT );
```

optionally, you can define action names to represent one or more keys
```actionscript
input.define( "moveLeft", KeyCode.LEFT, KeyCode.A );
input.define( "shoot", KeyCode.LMB );
```

test if either LEFT or A key were pressed
```actionscript
input.isPressed( "moveLeft" );
```


***

notes:
* LMB, MMB & RMB are mouse keys, the class treats them the same a keyboard inputs.
* MMB & RMB are supported as of flash player 11.2

todo:
Create an "undefine" method to somewhat "unbind" a key from an action. Haven't made a fully customizable controls for any of my projects so this wasn't made yet.