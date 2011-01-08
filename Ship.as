package {
import net.flashpunk.Entity;

public class Ship extends Entity {
	public var vel:vec = new vec(0,0);

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
}
}
