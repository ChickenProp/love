package {
import flash.geom.Point;
import net.flashpunk.*;
import net.flashpunk.graphics.Image;

public class Bullet extends Ship {
	[Embed(source = 'media/bullet-red.png')]
	public static var bullet_red:Class;
	[Embed(source = 'media/bullet-green.png')]
	public static var bullet_green:Class;

	public var color:String = "";

	public function Bullet(_x:Number, _y:Number, vx:Number, _color:String) {
		x = _x;
		y = _y;
		color = _color;
		vel = new Point(-vx, 0);
		type = "bullet";
		setHitbox(10, 10);

		image = new Image(Bullet["bullet_" + color]);
		image.scale = 0.2;
		image.centerOO();
		centerOrigin();
	}

	override public function update () : void {
		move();

		if (x <= -10) {
			FP.world.remove(this);
			if (color == "red") {
				Game.wifeHealth -= 10;
				Player.scoreMultiplier = 0;
				Audio.wife_ow.play();
			}
			else {
				// I don't like the sound effect, or the
				// mechanic of healing her.
				//Audio.wife_yay.play();
				//Game.wifeHealth += 1;
			}
		}
	}
}

}
