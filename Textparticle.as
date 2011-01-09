package {
import flash.geom.Point;
import net.flashpunk.*;
import net.flashpunk.graphics.*;

public class Textparticle extends Ship {
	public function Textparticle (_x:int, _y:int, text:String) {
		image = new Text(text);
		x = _x;
		y = _y;
		vel = new Point(-3, -1);
	}

	override public function update () : void {
		image.alpha -= 0.01;
		move();

		if (image.alpha <= 0)
			FP.world.remove(this);
	}
}
}
