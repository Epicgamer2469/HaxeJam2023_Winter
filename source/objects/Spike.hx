package objects;

import flixel.FlxSprite;

class Spike extends FlxSprite {
	public function new(X:Float, Y:Float, rotation:Int) {
		super(X, Y, "assets/images/spike.png");
		immovable = true;

		switch (rotation) {
			case 1:
				setSize(16, 3);
				y += 13;
			case 2:
				angle = 270;
				setSize(3, 16);
				offset.set(6, -6);
				x += 12;
			case 3:
				angle = 180;
				setSize(16, 3);
			case 4:
				angle = 90;
				setSize(3, 16);
				offset.set(6, -6);
		}
	}
}
