package;

import flixel.FlxGame;
import openfl.display.Sprite;
import states.MenuState;
import states.PlayState;
import util.Game;

class Main extends Sprite {
	public function new() {
		super();

		Game.init();

		addChild(new FlxGame(320, 180, MenuState, 60, 60, true));
	}
}
