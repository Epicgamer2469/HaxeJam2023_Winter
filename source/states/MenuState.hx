package states;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import objects.Player;
import util.Game;

class MenuState extends GameState {
	override function create() {
		super.create();

		FlxG.mouse.visible = false;

		Game.level = 1;

		var bg = new FlxSprite().loadGraphic('assets/images/menubg.png');

		var title = new FlxSprite(0, 0, 'assets/images/logo.png');
		title.scale.set(2, 2);
		title.updateHitbox();
		title.alpha = 0;
		title.screenCenter(X);
		title.angle -= 20;
		title.y = -title.height;

		var txt = Game.makeText('5px', 0, 0, "Press ENTER to start");
		txt.scale.set(2, 2);
		txt.updateHitbox();
		txt.screenCenter();
		txt.y += 40;
		txt.alpha = 0;

		transition.open(() -> {
			FlxTween.tween(title, {y: 10, alpha: 1}, 1.5, {ease: FlxEase.cubeOut});
			FlxTween.tween(title, {angle: 0}, 1, {ease: FlxEase.backOut});
			FlxTween.tween(txt, {alpha: 1}, 1.5, {startDelay: .25});
		});

		add(bg);
		add(title);
		add(txt);
	}

	override function update(elapsed:Float) {
		super.update(elapsed);

		if (FlxG.keys.justPressed.ENTER) {
			Game.playSound('confirm');
			transition.close(() -> {
				FlxG.switchState(new PlayState());
			});
		}
	}
}
