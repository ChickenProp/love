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

	public function Player() { 
		x = 50;
		y = 300;

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
		var a:Point = new Point(0,0);
		var rate : Number = 2;

		if (Input.check(Key.RIGHT))
			a.x++;
		if (Input.check(Key.LEFT))
			a.x--;
		if (Input.check(Key.UP))
			a.y--;
		if (Input.check(Key.DOWN))
			a.y++;

		a.normalize(1);
		accel(rate * a.x, rate * a.y);

		friction();
		move();

		x = FP.clamp(x, 15, 785);
		y = FP.clamp(y, 90, 570);

		var b:Bullet = collide("bullet", x, y) as Bullet;
		if (b)
			hitBullet(b);

		if (health <= 0) {
			Audio.player_die.play();
			Game.gameOver();
		}
	}

	public function hitBullet(b:Bullet) : void {
		FP.world.remove(b);
		if (b.color == "red") {
			health -= 10;

			scoreMultiplier++;

			Audio.player_ow.play();
		}
		else {
			health += 10;
			Audio.player_yay.play();
		}

		var points:int = Math.max(10 * scoreMultiplier, 10);
		score += points;
		FP.world.add(new Textparticle(b.x, b.y,
		                              points.toString()));
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
