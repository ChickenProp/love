package {
import net.flashpunk.*;
import net.flashpunk.graphics.*;
import net.flashpunk.utils.*;

public class Game extends World {
	public static var paused:Boolean = false;
	public var timeToBullet:int = 0;
	public var rgRatio:Number = 0.3;

	public function Game () {
		paused = false;
		wifeHealth = 100;

		add(new Player);
		add(new Lifebar(50, 10, 200, 20, "Shields",
		                function () : int { return 2*Player.health; }));
		add(new Lifebar(550, 10, 200, 20, "Wife's shields",
		                function () : int { return 2*wifeHealth; }));
		add(new Scoredisplay);

		Audio.music.loop();
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

		if (wifeHealth <= 0) {
			Audio.wife_die.play();
			gameOver();
		}
	}

	public function doBulletSpawnStuff() : void {
		if (timeToBullet <= 0) {
			addBullet();
			timeToBullet = FP.rand(10)+15;

			rgRatio = FP.approach(rgRatio, 0.45, 0.0003);
		}

		timeToBullet--;
	}

	public function addBullet() : void {
		add(new Bullet(810, FP.rand(520) + 70,
		               Math.random() < rgRatio ? "red" : "green"));
	}

	public static function gameOver() : void {
		Data.save("love-spaceships-data");
		FP.world = new Deathscreen();
	}

	public static function get wifeHealth() : int { return _health; }
	public static function set wifeHealth(h:int) : void {
		_health = FP.clamp(h, 0, 100);
	}
	public static var _health:int = 100;
}

}
