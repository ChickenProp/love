package {
import net.flashpunk.*;
import net.flashpunk.graphics.*;
import net.flashpunk.utils.*;

public class Introscreen extends Graphicscreen {
	public function Introscreen () {
		var wd:int = Main.screen_width;
		var ht:int = Main.screen_height;

		var opts:Object = { align: "center",
				    width: Main.screen_width,
				    height: Main.screen_height };

		var title1:Text = new Text("Love", 0, 200, opts);
		title1.size = 80;
		var title2:Text = new Text("in the time of spaceships",
		                           0, 270, opts);
		title2.size = 30;

		var presstoplay:Text = new Text("Press to play",
		                                0, 400, opts);
		presstoplay.size = 30;

		graphics.add(title1);
		graphics.add(title2);
		graphics.add(presstoplay);
	}

	override public function update () : void {
		if (Input.mousePressed) {
			FP.world = new Game;
		}
	}
}
}







