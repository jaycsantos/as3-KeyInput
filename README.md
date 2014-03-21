# as3-KeyInput

AS3 input handler with optional action names


### Usage

initialize (where this is likely your Main displayobject
```actionscript
var input:KeyInput = new KeyInput( this );
```

inside your loop
```actionscript
input.isDown( KeyCode.LEFT );
input.isDown( KeyCode.RIGHT );
```

optionally define action names for one or more keys
```actionscript
input.define( "moveLeft", KeyCode.LEFT, KeyCode.A );
input.define( "shoot", KeyCode.LMB, KeyCode.SPACE );
```

this now to check if either LEFT or A keys were pressed
```actionscript
input.isPressed( "moveLeft" );
```


***

notes:
* LMB, MMB & RMB are mouse keys, the class treats them the same a keyboard inputs.
* MMB & RMB are supported as of flash player 11.2

todo:
Create an "undefine" method to somewhat "unbind" a key from an action. Haven't made a fully customizable controls for any of my projects so this wasn't made yet.