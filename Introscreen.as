package {
import net.flashpunk.*;
import net.flashpunk.graphics.*;
import net.flashpunk.utils.*;

public class Introscreen extends Graphicscreen {
	public function Introscreen () {
		var opts:Object = { align: "center",
				    width: Main.screen_width,
				    height: Main.screen_height };

		var title1:Text = new Text("Love", 0, 200, opts);
		title1.size = 80;
		var title2:Text = new Text("in the time of spaceships",
		                           0, 270, opts);
		title2.size = 32;

		var presstoplay:Text = new Text("Press to play",
		                                0, 400, opts);
		presstoplay.size = 32;

		var attrib:Text = new Text("By Phil Hazelden\n"
		                           + "Music by Kevin MacLeod",
		                           0, 500, opts);
		attrib.size = 24;

		graphics.add(title1);
		graphics.add(title2);
		graphics.add(presstoplay);
		graphics.add(attrib);
	}

	override public function update () : void {
		if (Input.mousePressed) {
			FP.world = new Game;
		}
	}
}
}







