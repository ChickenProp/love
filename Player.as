package {
import net.flashpunk.FP;
import flash.geom.Point;
import net.flashpunk.*;
import net.flashpunk.utils.*;
import net.flashpunk.graphics.Image;

public class Player extends Ship {
	[Embed(source = 'media/player.png')]
	private const PLAYER:Class;

	public static var scoreMultiplier:int;

	public var targetX:Number = 50;
	public var targetY:Number = 300;

	public function Player() {
		x = targetX;
		y = targetY;

		image = new Image(PLAYER);
		image.centerOO();
		type = "player";
		setHitbox(30, 60);
		centerOrigin();
		health = 100;
		score = 0;
		scoreMultiplier = 0;
	}

	override public function update() : void {
		if (Game.mouseInScreen()) {
			targetX = Input.mouseX;
			targetY = Input.mouseY;
		}
		x = x + (targetX - x)*0.3;
		y = y + (targetY - y)*0.3;

		x = FP.clamp(x, halfWidth, Main.screen_width - halfWidth);
		y = FP.clamp(y, 60+halfHeight, Main.screen_height - halfHeight);

		var b:Bullet = collide("bullet", x, y) as Bullet;
		if (b)
			hitBullet(b);

		if (health <= 0) {
			Audio.player_die.play();
			Game.gameOver(0);
		}

		doTint();
	}

	public function hitBullet(b:Bullet) : void {
		FP.world.remove(b);
		if (b.color == "red") {
			health -= 10;

			scoreMultiplier++;

			Audio.player_ow.play();

			if (health > 10)
				flashOnce();
			else
				flashLots();
		}
		else {
			health += 10;
			Audio.player_yay.play();
			stopFlash();
		}

		var points:int = Math.max(10 * scoreMultiplier, 10);
		score += points;
		FP.world.add(new Textparticle(b.x, b.y, b.vel.x,
		                              points.toString()));
	}

	// 0 - not flashing, 1 - once/on, 2 - once/off,
	// 3 - constant/on, 4 - constant/off
	public var flashing:int = 0;

	//As a special case, if we're turning a once-flash off, turn it back on.
	public function flashOnce() : void {
		if (flashing == 0 || flashing == 2)
			flashing = 1;
	}

	public function flashLots() : void {
		if (flashing == 0 || flashing == 1)
			flashing = 3;
		if (flashing == 2)
			flashing = 4;
	}

	public function stopFlash() : void {
		if (flashing >= 3)
			flashing -= 2;
	}

	public var redness:int = 0;
	public function doTint() : void {
		if (flashing == 1 || flashing == 3) {
			if (redness < 15)
				redness++;
			else
				flashing++;
		}

		if (flashing == 2 || flashing == 4) {
			if (redness > 0)
				redness--;
			else
				flashing = (flashing == 2 ? 0 : 3);
		}

		var r:int, g:int, b:int;
		b = 0xFF - redness*10;
		g = b*0x100;
		r = 0xFF0000;
		image.color = r+g+b;

		FP.console.log(image.color);
	}
	
	public static function get health() : int {
		return _health;
	}
	public static function set health(h:int) : void {
		_health = FP.clamp(h, 0, 100);
	}
	internal static var _health:int;

	public static function get score() : int { return _score; }
	public static function set score(s:int) : void {
		_score = s;
		highScore = Math.max(highScore, s);
	}
	internal static var _score:int;

	public static function get highScore() : int {
		return Data.readInt("highScore");
	}
	public static function set highScore(s:int) : void {
		Data.writeInt("highScore", s);
	}
}
}
