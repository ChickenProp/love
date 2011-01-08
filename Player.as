package {
import net.flashpunk.Entity;
import net.flashpunk.utils.Input;
import net.flashpunk.utils.Key;
import net.flashpunk.graphics.Image;

public class Player extends Entity {
	[Embed(source = 'media/player.png')]
	private const PLAYER:Class;

	public var vel:vec = new vec(0,0);

	public function Player() { 
		graphic = new Image(PLAYER);
	}

	public function speed() : Number {
		return vel.length();
	}

	public function accel(x2:Number, y2:Number) : void {
		vel.x += x2;
		vel.y += y2;
	}

	public function friction() : void {
		accel(-vel.x/5, -vel.y/5);
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

		x += vel.x;
		y += vel.y;
	}
}
}
