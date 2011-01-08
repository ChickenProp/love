package {
import net.flashpunk.FP;
import net.flashpunk.World;
import net.flashpunk.utils.*;

public class Game extends World {
	public static var paused:Boolean = false;

	public function Game () {
		paused = false;

		add(new Player);
		add(new Bullet(750, 300));
	}

	override public function update() : void {
		if (!paused)
			super.update();

		if (Input.pressed(Key.R))
			FP.engine.init();
		if (Input.pressed(Key.P))
			paused = !paused;
	}
}

}
