package {
import net.flashpunk.*;
import net.flashpunk.graphics.*;
import net.flashpunk.utils.*;

public class Game extends World {
	public static var paused:Boolean = false;
	public var timeToBullet:int = 0;

	public function Game () {
		paused = false;

		add(new Player);
		add(new Lifebar(50, 10, 200, 20, "Health",
		                function () : int { return 2*Player.health; }));
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
		               FP.rand(10) ? "red" : "green"));
	}
}

}
