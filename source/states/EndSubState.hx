package states;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.group.FlxGroup;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxStringUtil;
import util.Game;

class EndSubState extends FlxSubState {
	public function new() {
		super();

		var bg = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, 0x80000000);

		bg.cameras = [PlayState.instance.hudCam];

		var timeTxt = Game.makeText('5px', 0, 0, '	Thanks for playing!');
		timeTxt.screenCenter();
		timeTxt.alpha = 0;
		FlxTween.tween(timeTxt, {
			alpha: 1,
		}, 1.5, {ease: FlxEase.cubeOut});
		timeTxt.cameras = [PlayState.instance.hudCam];

		var t = Game.makeText('5px', 0, 0, 'You died: ' + Game.deathCount + ' times.');
		t.screenCenter();
		t.alpha = 0;
		t.y = timeTxt.y + 25;

		FlxTween.tween(t, {
			alpha: 1,
		}, 1.5, {ease: FlxEase.cubeOut});
		t.cameras = [PlayState.instance.hudCam];

		var opoop = Game.makeText('5px', 0, 0, 'Press ENTER\nto return to\nthe menu.');
		opoop.screenCenter();
		opoop.y = t.y + 50;
		opoop.alpha = 0;
		FlxTween.tween(opoop, {
			alpha: 1,
		}, 1.5, {startDelay: .5, ease: FlxEase.cubeOut});
		opoop.cameras = [PlayState.instance.hudCam];

		add(bg);
		add(timeTxt);
		add(t);
		add(opoop);
	}

	override function update(elapsed:Float) {
		super.update(elapsed);

		if (FlxG.keys.justPressed.ENTER) {
			Game.playSound('confirm');
			PlayState.instance.remove(PlayState.instance.transition);
			add(PlayState.instance.transition);
			PlayState.instance.transition.close(() -> {
				FlxG.switchState(new MenuState());
			});
		}
	}
}
