package util;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.graphics.frames.FlxBitmapFont;
import flixel.group.FlxGroup;
import flixel.system.FlxSound;
import flixel.text.FlxBitmapText;
import flixel.text.FlxText;
import flixel.tile.FlxTileblock;
import flixel.util.FlxSave;
import openfl.Assets;

class Game {
	public static inline final NUM_LEVELS:Int = 5;
	public static inline final START_LEVEL:Int = 1;
	public static var deathCount:Int = 0;
	public static var save:FlxSave = new FlxSave();
	public static var level:Int = 1;

	public static function init() {
		save.bind('reloop');

		save.flush();

		#if debug
		level = START_LEVEL;
		#end
	}

	public static function playSound(sound:String, volume:Float = 1) {
		return FlxG.sound.play('assets/sounds/$sound${getEXT()}', volume);
	}

	public static function playMusic(sound:String, volume:Float = 1) {
		FlxG.sound.playMusic('assets/music/$sound${getEXT()}', volume);
	}

	public static function getEXT() {
		#if desktop
		return '.ogg';
		#else
		return '.mp3';
		#end
	}

	inline public static function getCenter(text:FlxBitmapText, x:Float, width:Float) {
		return x + (width / 2 - text.width / 2);
	}

	public static function makeText(font:String, x:Float = 0, y:Float = 0, txt:String = "") {
		final xml = Xml.parse(Assets.getText('assets/fonts/$font.fnt'));
		final font = FlxBitmapFont.fromAngelCode('assets/fonts/${font}_0.png', xml);
		final text = new FlxBitmapText(font);
		text.setPosition(x, y);
		text.text = txt;

		return text;
	}
}
