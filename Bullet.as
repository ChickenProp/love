package {
import flash.geom.Point;
import net.flashpunk.graphics.Image;

public class Bullet extends Ship {
	[Embed(source = 'media/bullet-white.png')]
	private const BULLET_WHITE:Class;

	public function Bullet(_x:Number, _y:Number) {
		x = _x;
		y = _y;
		vel = new Point(-3, 0);

		image = new Image(BULLET_WHITE);
		image.scale = 0.2;
	}
}

}
