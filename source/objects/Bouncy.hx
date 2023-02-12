package objects;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class Bouncy extends FlxSprite {
	public function new(x:Float, y:Float) {
		super(x, y, "assets/images/bouncy.png");
		immovable = true;
		origin.y = height;
	}

	var tween:FlxTween;

	public function hit(obj:FlxObject) {
		obj.velocity.y = -1000;

		if (tween != null)
			tween.cancel();

		this.scale.x = 1.1;
		this.scale.y = .9;
		tween = FlxTween.tween(this.scale, {x: 1, y: 1}, 0.5, {ease: FlxEase.elasticOut, onComplete: twn -> {
			tween = null;
		}});
	}
}
