package states;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxSliceSprite;
import flixel.addons.editors.ogmo.FlxOgmo3Loader;
import flixel.addons.effects.FlxTrail;
import flixel.addons.tile.FlxTilemapExt;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxGroup;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.text.FlxBitmapText;
import flixel.tile.FlxTilemap;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import objects.Bouncy;
import objects.Player;
import objects.Spike;
import util.Game;

class PlayState extends GameState {
	var corpses:FlxTypedGroup<Player> = new FlxTypedGroup<Player>();
	var maps:FlxTypedGroup<FlxTilemap> = new FlxTypedGroup<FlxTilemap>();
	var spikes:FlxTypedGroup<Spike> = new FlxTypedGroup<Spike>();
	var bouncies:FlxTypedGroup<Bouncy> = new FlxTypedGroup<Bouncy>();
	var unspawns:FlxTypedGroup<FlxSprite> = new FlxTypedGroup<FlxSprite>();
	var colliders:FlxGroup = new FlxGroup();
	var player:Player;
	var trailPlayer:FlxTrail;
	var door:FlxSprite;

	public static var instance:PlayState;

	var map:FlxOgmo3Loader;
	var level:FlxTilemap;
	var special:FlxTilemap;
	var bg:FlxSprite;
	var nameText:FlxBitmapText;

	var spawn:FlxPoint = FlxPoint.get();
	var restarting:Bool = false;

	override public function create() {
		super.create();

		instance = this;

		if (FlxG.sound.music == null || !FlxG.sound.music.playing)
			Game.playMusic('loop2', .5);

		bg = new FlxSprite(0, 0, 'assets/images/bg.png');
		bg.alpha = .25;
		add(bg);

		map = new FlxOgmo3Loader('assets/data/levels/main.ogmo', 'assets/data/levels/level${Game.level}.json');

		level = map.loadTilemap('assets/images/tiles.png', 'tiles');
		maps.add(level);
		colliders.add(level);

		nameText = Game.makeText('5px', 1, 1, '${Game.level} - ${map.getLevelValue('name')}');
		nameText.cameras = [hudCam];
		nameText.y = -nameText.height;
		nameText.alpha = 0;
		insert(0, nameText);

		transition.open(() -> {
			FlxTween.tween(nameText, {alpha: 1, y: -2}, 1, {ease: FlxEase.cubeInOut});
		});

		special = map.loadTilemap('assets/images/special.png', 'special');
		loadSpecialTiles();
		maps.add(special);
		colliders.add(special);

		colliders.add(spikes);

		add(spikes);
		add(bouncies);
		add(maps);

		door = new FlxSprite(0, 0, 'assets/images/door.png');
		add(door);

		add(corpses);

		player = new Player();
		add(player);

		add(unspawns);

		map.loadEntities(loadEntities, "entities");
	}

	function loadEntities(entity:EntityData) {
		switch (entity.name) {
			case "player":
				player.setPosition(entity.x, entity.y);
				spawn.set(entity.x, entity.y);
			case 'door':
				door.setPosition(entity.x, entity.y);
			case 'area':
				var area = new FlxSliceSprite('assets/images/area.png', FlxRect.get(11, 11, 11, 11), entity.width, entity.height);
				area.setPosition(entity.x, entity.y);
				unspawns.add(area);
			default:
				FlxG.log.add('Unrecognized actor type ${entity.name}');
		}
	}

	var leaving:Bool = false;

	override public function update(elapsed:Float) {
		super.update(elapsed);

		if (!leaving && FlxG.keys.justPressed.R) {
			transition.close(() -> {
				FlxG.resetState();
			});
			leaving = true;
			player.disabled = true;
		}

		if (!restarting) {
			FlxG.collide(player, maps);
			FlxG.collide(player, bouncies, bounceHit);
			FlxG.collide(player, spikes, spikeHit);
			FlxG.collide(player, corpses);
		}

		FlxG.collide(corpses, colliders);
		FlxG.collide(corpses, bouncies, bounceHit);
		FlxG.collide(corpses, corpses);

		if (!leaving && FlxG.overlap(player, door)) {
			leaving = true;
			if (Game.level < Game.NUM_LEVELS)
				Game.level++;
			else {
				openSubState(new EndSubState());
				return;
			}

			player.disabled = true;
			player.acceleration.x = 0;
			player.velocity.y = 0;
			player.animation.play('leave');

			new FlxTimer().start(.3, tmr -> {
				transition.close(() -> {
					FlxG.switchState(new PlayState());
				});
			});
		}
	}

	function bounceHit(collider:FlxObject, tile:FlxObject) {
		cast(tile, Bouncy).hit(collider);
	}

	function spikeHit(collider:FlxObject, tile:FlxObject) {
		var p:Player = cast collider;
		if (p.disabled)
			return;

		Game.deathCount++;

		if (!FlxG.overlap(p, unspawns)) {
			p.die();

			player = new Player(p.x, p.y);
			insert(members.indexOf(p), player);

			remove(p);
			corpses.add(p);
		}

		Game.playSound('back', .7);

		player.animation.play("dead");
		player.disabled = true;
		player.velocity.set();
		player.acceleration.set();

		var trail = new FlxTrail(player, null, 5);
		insert(members.indexOf(player) - 1, trail);

		// calculate the time it takes to get to the spawn point realative to current postiion, clamp to 1
		var time:Float = Math.min(1, Math.sqrt(Math.pow(player.x - spawn.x, 2) + Math.pow(player.y - spawn.y, 2)) / 120);
		trace(time);
		FlxTween.tween(player, {x: spawn.x, y: spawn.y}, time, {
			ease: FlxEase.cubeIn,
			onStart: twn -> {
				restarting = true;
			},
			onComplete: twn -> {
				restarting = false;
				player.disabled = false;
				player.acceleration.y = Player.GRAV;
				trail.destroy();
				player.animation.play("idle");

				gameCam.flash(0xffffffff, .35);
			}
		});
	}

	function loadSpecialTiles() {
		for (i in 0...special.widthInTiles) {
			for (j in 0...special.heightInTiles) {
				switch (special.getTile(i, j)) {
					case 1 | 2 | 3 | 4:
						var spike:Spike = new Spike(i * special.tileWidth, j * special.tileHeight, special.getTile(i, j));
						spikes.add(spike);

						special.setTile(i, j, 0);
					case 5:
						var bouncy:Bouncy = new Bouncy(i * special.tileWidth, j * special.tileHeight);
						bouncies.add(bouncy);

						special.setTile(i, j, 0);
					default:
				}
			}
		}
	}
}
