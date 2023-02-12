package util;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

class Transition extends FlxTypedGroup<FlxSprite> {
	static inline final DURATION:Float = .8;

	var left:FlxSprite;
	var right:FlxSprite;

	public function new() {
		super();

		left = new FlxSprite(0, 0, 'assets/images/transition.png');
		right = new FlxSprite(FlxG.width / 2, 0, 'assets/images/transition.png');
		right.flipY = true;

		left.visible = right.visible = false;

		add(left);
		add(right);
	}

	public function open(?callback:() -> Void) {
		if (callback == null)
			callback = () -> {};

		left.visible = right.visible = true;

		left.y = -80;
		right.y = 0;
		FlxTween.tween(left, {y: FlxG.height}, DURATION, {ease: FlxEase.cubeIn});
		FlxTween.tween(right, {y: -right.height}, DURATION, {ease: FlxEase.cubeIn, onComplete: twn -> callback()});
	}

	public function close(?callback:() -> Void) {
		if (callback == null)
			callback = () -> {};

		left.visible = right.visible = true;

		left.y = FlxG.height;
		right.y = -right.height;
		FlxTween.tween(left, {y: -80}, DURATION, {ease: FlxEase.cubeOut});
		FlxTween.tween(right, {y: 0}, DURATION, {ease: FlxEase.cubeOut, onComplete: twn -> callback()});
	}
}
