package {
import net.flashpunk.*;
import net.flashpunk.graphics.*;
import net.flashpunk.utils.*;

public class Deathscreen extends Graphicscreen {
	public var alpha:Number = 0;

	public function Deathscreen (which:int) {
		var opts:Object = { align: "center",
				    width: Main.screen_width,
				    height: Main.screen_height };

		var msg:String;
		if (which) {
			msg = "With your wife's dying breath,\n"
				+ "she forgives you.";
		}
		else {
			msg = "In your last moments,\nall you can do\n"
				+ "is apologize.";
		}


		var msgT:Text = new Text(msg, 0, 200, opts);
		msgT.size = 32;
		msgT.leading = 4;

		var presstoplay:Text = new Text("Press to play again",
		                                0, 400, opts);
		presstoplay.size = 32;

		var score:Text = new Text("Score: " + Player.score
		                          + "\nHigh score: " + Player.highScore,
		                          0, 500, opts);

		graphics.add(msgT);
		graphics.add(presstoplay);
		graphics.add(score);

		graphics.children.map(function(g:Graphic, a:*, b:*):void {
		                var i:Image = g as Image;
				i.alpha = alpha;
		        });
	}

	override public function update () : void {
		alpha += 0.1;
		Audio.music.volume -= 0.1;

		graphics.children.map(function(g:Graphic, a:*, b:*):void {
		                var i:Image = g as Image;
				i.alpha = alpha;
		        });

		if (alpha >= 1 && Input.mousePressed)
			FP.world = new Game;
	}
}
}





