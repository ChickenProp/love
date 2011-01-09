package {
import net.flashpunk.FP;
import flash.geom.Point;
import net.flashpunk.*;
import net.flashpunk.utils.Input;
import net.flashpunk.utils.Key;
import net.flashpunk.graphics.Image;

public class Player extends Ship {
	[Embed(source = 'media/player.png')]
	private const PLAYER:Class;

	[Embed(source = 'media/player-ow.mp3', mimeType = 'audio/mpeg')]
	private const OW:Class;

	public var ow:Sfx = new Sfx(OW);

	public static var health:int = 100;

	public function Player() { 
		x = 32;
		y = 32;

		image = new Image(PLAYER);
		image.centerOO();
		type = "player";
		setHitbox(50, 50);
		centerOrigin();
		health = 100;
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
			FP.world.remove(b);
			if (b.color == "red") {
				health -= 10;
				ow.play();
			}
			else {
				health += 10;
			}
		}

		if (health <= 0) {
			FP.engine.init();
		}
	}
}
}
