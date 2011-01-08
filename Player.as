package {
import net.flashpunk.utils.Input;
import net.flashpunk.utils.Key;
import net.flashpunk.graphics.Image;

public class Player extends Ship {
	[Embed(source = 'media/player.png')]
	private const PLAYER:Class;

	public function Player() { 
		image = new Image(PLAYER);
	}

	override public function update() : void {
		var a:vec = new vec(0,0);
		var rate : Number = 2;

		if (Input.check(Key.RIGHT))
			a.x++;
		if (Input.check(Key.LEFT))
			a.x--;
		if (Input.check(Key.UP))
			a.y--;
		if (Input.check(Key.DOWN))
			a.y++;

		a = a.normalize();
		accel(rate * a.x, rate * a.y);

		friction();
		move();
	}
}
}
