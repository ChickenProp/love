package {
import net.flashpunk.FP;
import flash.geom.Point;
import net.flashpunk.utils.Input;
import net.flashpunk.utils.Key;
import net.flashpunk.graphics.Image;

public class Player extends Ship {
	[Embed(source = 'media/player.png')]
	private const PLAYER:Class;

	public var health:int = 100;

	public function Player() { 
		image = new Image(PLAYER);
		type = "player";
		setHitbox(50, 50);
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

		var b:Bullet = collide("bullet", x, y) as Bullet;
		if (b) {
			health -= 10;
			FP.world.remove(b);
		}

		if (health <= 0) {
			FP.engine.init();
		}
	}
}
}
