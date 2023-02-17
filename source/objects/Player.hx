package objects;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import states.PlayState;
import util.Game;

class Player extends FlxSprite {
	public static inline final SPEED:Int = 650;
	public static inline final MAX_XSPEED:Int = 90;
	public static inline final MAX_YSPEED:Int = 260;
	public static inline final JUMP:Int = 120;
	public static inline final GRAV:Int = 630;

	public var jumping:Bool = false;
	public var disabled:Bool = false;

	var walking:Bool = false;
	var jumpTimer:Float = 0;
	var walkTimer:Float = 0;

	public function new(x:Float = 0, y:Float = 0) {
		super(x, y);

		loadGraphic("assets/images/player.png", true, 16, 16);
		animation.add("idle", [0], 12, true);
		animation.add("walk", [1, 2, 3], 12, false);
		animation.add("jump", [5, 6, 7], 6, false);
		animation.add("leave", [8], 6, false);
		animation.add("dead", [9], 6, false);
		animation.play('idle');

		acceleration.y = GRAV;
		drag.x = SPEED;
		maxVelocity.set(MAX_XSPEED, MAX_YSPEED);

		setSize(10, 11);
		offset.set(3, 5);

		FlxG.watch.add(this, "velocity");
		FlxG.watch.add(this, "grounded");
	}

	var grounded:Bool = false;
	var coyoteTime:Float = 0;

	override public function update(elapsed:Float) {
		if (!disabled) {
			if (isTouching(FLOOR)) {
				grounded = true;
				coyoteTime = .08;
			} else {
				grounded = false;
			}

			if (!grounded)
				coyoteTime -= elapsed;

			updateMovement(elapsed);

			walkTimer -= elapsed;

			if (walkTimer <= 0 && walking) {
				Game.playSound('step-0${FlxG.random.int(1, 5)}', 5);
				walkTimer = .25;
			}
		} else {
			if (isTouching(FLOOR) && drag.x < SPEED)
				drag.x += SPEED / 6;
		}

		super.update(elapsed);
	}

	function updateMovement(elapsed:Float) {
		acceleration.x = 0;
		walking = false;

		if (jumping && !FlxG.keys.anyPressed([UP, W]))
			jumping = false;

		if (isTouching(CEILING))
			jumpTimer = -1;

		if ((grounded || coyoteTime >= 0) && !jumping) {
			jumpTimer = 0;
		}

		if (FlxG.keys.anyPressed([LEFT, A])) {
			if (velocity.x > 0)
				velocity.x /= 10;

			acceleration.x = -SPEED;
			flipX = true;
			walking = grounded;
			if (grounded)
				animation.play("walk");
		}

		if (FlxG.keys.anyPressed([RIGHT, D])) {
			if (velocity.x < 0)
				velocity.x /= 10;

			acceleration.x = SPEED;
			flipX = false;
			walking = grounded;
			if (grounded)
				animation.play("walk");
		}

		if (velocity.x == 0 && grounded)
			animation.play("idle");

		if (jumpTimer >= 0 && FlxG.keys.anyPressed([UP, W])) {
			jumping = true;
			jumpTimer += elapsed;
			if (FlxG.keys.justPressed.UP) {
				animation.play("jump");
				// FlxG.sound.play('assets/sounds/jump.ogg');
			}
		} else
			jumpTimer = -1;

		if (jumpTimer > 0 && jumpTimer < .25) {
			velocity.y = -JUMP;
		}
	}

	public function die() {
		animation.play("dead");
		disabled = true;
		acceleration.x = 0;
		elasticity = .5;
		drag.x = 0;

		setSize(10, 8);
	}
}
