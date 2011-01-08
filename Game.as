package {
import net.flashpunk.World;

public class Game extends World {
	public function Game () {
		add(new Player);
		add(new Bullet(750, 300));
	}
}

}
