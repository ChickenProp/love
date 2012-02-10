package {
import net.flashpunk.*;
import net.flashpunk.graphics.*;
import net.flashpunk.utils.*;

public class Deathscreen extends Graphicscreen {
	public var alpha:Number = 0;

	public function Deathscreen () {
		var opts:Object = { align: "center",
				    width: Main.screen_width,
				    height: Main.screen_height };

		var msg1:Text = new Text("With your wife's dying breath,",
		                         0, 200, opts);
		msg1.size = 30;
		
		var msg2:Text = new Text("she forgives you.",
		                         0, 240, opts);
		msg2.size = 30;

		var presstoplay:Text = new Text("Press any key to play again",
		                                0, 400, opts);
		presstoplay.size = 30;

		var score:Text = new Text("Score: " + Player.score
		                          + "\nHigh score: " + Player.highScore,
		                          0, 500, opts);

		graphics.add(msg1);
		graphics.add(msg2);
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

		if (alpha >= 1 && Input.lastKey && Input.pressed(Input.lastKey))
			FP.world = new Game;
	}
}
}





