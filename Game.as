package {
import net.flashpunk.*;
import net.flashpunk.graphics.*;
import net.flashpunk.utils.*;

public class Game extends World {
	[ Embed(source = 'media/background.png') ]
	public static const BACKGROUND:Class;
	public static var paused:Boolean = false;
	public var timeToBullet:int = 0;
	public var rgRatio:Number = 0.3;
	public var bulletvel:Number = 6;
	public var bg:Backdrop;

	public function Game () {
		paused = false;
		wifeHealth = 100;

		add(new Player);
		add(new Lifebar(50, 10, 200, 20, "Shields",
		                function () : int { return 2*Player.health; }));
		add(new Lifebar(550, 10, 200, 20, "Wife's shields",
		                function () : int { return 2*wifeHealth; }));
		add(new Scoredisplay);

		bg = new Backdrop(BACKGROUND, true, false);
		bg.y = 60;
		addGraphic(bg);

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
			gameOver(1);
		}

		bg.x -= 1;
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
		add(new Bullet(Main.screen_width, FP.rand(520) + 70,
		               bulletvel + FP.random*3-1,
		               Math.random() < rgRatio ? "red" : "green"));
	}

	public static function gameOver(which:int) : void {
		Data.save("love-spaceships-data");
		FP.world = new Deathscreen(which);
	}

	public static function get wifeHealth() : int { return _health; }
	public static function set wifeHealth(h:int) : void {
		_health = FP.clamp(h, 0, 100);
	}
	public static var _health:int = 100;

	public static function mouseInScreen () : Boolean {
		var x:Number = Input.mouseX;
		var y:Number = Input.mouseY;

		return x >= 0 && x <= Main.screen_width
			&& y >= 0 && y <= Main.screen_height;
	}
}

}
