package {
import net.flashpunk.*;
import net.flashpunk.graphics.*;
import net.flashpunk.utils.*;

public class Introscreen extends Graphicscreen {
	public function Introscreen () {
		var title1:Text = new Text("Love", 300, 200, 800, 600);
		title1.size = 80;
		var title2:Text = new Text("in the time of spaceships",
		                           180, 270, 800, 600);
		title2.size = 30;

		var presstoplay:Text = new Text("Press any key to play",
		                                200, 400, 800, 600);
		presstoplay.size = 30;

		graphics.add(title1);
		graphics.add(title2);
		graphics.add(presstoplay);
	}

	override public function update () : void {
		if (Input.lastKey && Input.pressed(Input.lastKey)) {
			FP.world = new Game;
		}
	}
}
}







