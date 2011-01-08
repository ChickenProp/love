package {
import net.flashpunk.FP;
import net.flashpunk.World;
import net.flashpunk.utils.*;

public class Game extends World {
	public static var paused:Boolean = false;
	public var timeToBullet:int = 0;

	public function Game () {
		paused = false;

		add(new Player);
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
			add(new Bullet(750, 300));
			timeToBullet = 20;
		}

		timeToBullet--;
	}
}

}
