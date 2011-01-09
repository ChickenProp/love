package {
import net.flashpunk.*;
import net.flashpunk.graphics.*;
import net.flashpunk.utils.*;

public class Game extends World {
	public static var paused:Boolean = false;
	public var timeToBullet:int = 0;

	public function Game () {
		paused = false;
		wifeHealth = 100;

		add(new Player);
		add(new Lifebar(50, 10, 200, 20, "Health",
		                function () : int { return 2*Player.health; }));
		add(new Lifebar(550, 10, 200, 20, "Wife's health",
		                function () : int { return 2*wifeHealth; }));
		add(new Scoredisplay);
	}

	override public function update() : void {
		if (Input.pressed(Key.R))
			FP.engine.init();
		if (Input.pressed(Key.P))
			paused = !paused;

		if (paused)
			return;

		doBulletSpawnStuff();

		super.update();

		if (wifeHealth <= 0)
			gameOver();
	}

	public function doBulletSpawnStuff() : void {
		if (timeToBullet <= 0) {
			addBullet();
			timeToBullet = FP.rand(10)+15;
		}

		timeToBullet--;
	}

	public function addBullet() : void {
		add(new Bullet(750, FP.rand(500) + 50,
		               FP.rand(3) ? "red" : "green"));
	}

	public static function gameOver() : void {
		FP.engine.init();
	}

	public static function get wifeHealth() : int { return _health; }
	public static function set wifeHealth(h:int) : void {
		_health = FP.clamp(h, 0, 100);
	}
	public static var _health:int = 100;
}

}
