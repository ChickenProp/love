package {
import net.flashpunk.graphics.Image;

public class Bullet extends Ship {
	[Embed(source = 'media/bullet-white.png')]
	private const BULLET_WHITE:Class;

	public function Bullet(_x:Number, _y:Number) {
		x = _x;
		y = _y;
		vel = new vec(-3, 0);

		/* It's internally stored as a Graphic, so I have to set scale
		   before I assign it. */
		var img:* = new Image(BULLET_WHITE);
		img.scale = 0.2;
		graphic = img;
	}
}

}
