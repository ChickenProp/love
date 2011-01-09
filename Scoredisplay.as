package {
import net.flashpunk.*;
import net.flashpunk.graphics.*;

public class Scoredisplay extends Entity {
	public var score:Text = new Text("             ");
	public var highScore:Text = new Text("               ");

	public function Scoredisplay () {
		var label1:* = new Text("Score", 0, 20);
		var label2:* = new Text("High score", 100, 20);
		highScore.x = 100;
		graphic = new Graphiclist(score, label1, highScore, label2);
		x = 300;
		y = 10;
	}

	override public function update () : void {
		score.text = Player.score.toString();
		highScore.text = Player.highScore.toString();
	}
}
}
