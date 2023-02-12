package states;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxState;
import objects.Camera;
import objects.Cursor;
import util.Game;
import util.Transition;

class GameState extends FlxState
{
	public var gameCam:Camera;
	public var hudCam:Camera;
	public var transition:Transition;

	override function create()
	{
		super.create();

		gameCam = new Camera(-30, -30, FlxG.width + 60, FlxG.height + 60);
		gameCam.scroll.set(-30, -30);
		hudCam = new Camera(-30, -30, FlxG.width + 60, FlxG.height + 60);
		hudCam.scroll.set(-30, -30);
		hudCam.bgColor.alpha = 0;

		FlxG.cameras.reset(gameCam);
		FlxG.cameras.add(hudCam);
		FlxCamera.defaultCameras = [gameCam];

		transition = new Transition();
		transition.cameras = [hudCam];
		add(transition);
	}
}
