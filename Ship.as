package {
import flash.geom.Point;
import net.flashpunk.Entity;
import net.flashpunk.graphics.Image;

public class Ship extends Entity {
	public var vel:Point = new Point(0,0);

	public function Ship() { 
	}

	public function accel(x2:Number, y2:Number) : void {
		vel.x += x2;
		vel.y += y2;
	}

	public function friction() : void {
		accel(-vel.x/5, -vel.y/5);
	}

	public function move() : void {
		x += vel.x;
		y += vel.y;
	}

	override public function update() : void {
		move();
	}

	public function get image() : Image {
		return _image;
	}
	public function set image(i:Image) : void {
		_image = i;
		graphic = i;
	}

	internal var _image:Image;
}
}
