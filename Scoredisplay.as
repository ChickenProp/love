package {
import net.flashpunk.*;
import net.flashpunk.graphics.*;

public class Scoredisplay extends Entity {
	public var score:Text = new Text("xxxxxxxxxxxxxx");

	public function Scoredisplay () {
		var label:* = new Text("Score", 0, 20);
		graphic = new Graphiclist(score, label);
		x = 300;
		y = 10;
	}

	override public function update () : void {
		score.text = Player.score.toString();
	}
}
}
