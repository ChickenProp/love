package {
import net.flashpunk.*;
import net.flashpunk.graphics.*;
import net.flashpunk.utils.*;

public class Deathscreen extends Graphicscreen {
	public var alpha:Number = 0;

	public function Deathscreen () {
		var msg1:Text = new Text("With your wife's dying breath,",
		                            140, 200, 800, 600);
		msg1.size = 30;
		
		var msg2:Text = new Text("she forgives you.",
		                         250, 240, 800, 600);
		msg2.size = 30;

		var presstoplay:Text = new Text("Press any key to play again",
		                                160, 400, 800, 600);
		presstoplay.size = 30;

		graphics.add(msg1);
		graphics.add(msg2);
		graphics.add(presstoplay);

		graphics.children.map(function(g:Graphic, a:*, b:*):void {
		                var i:Image = g as Image;
				i.alpha = alpha;
		        });
	}

	override public function update () : void {
		alpha += 0.1;

		graphics.children.map(function(g:Graphic, a:*, b:*):void {
		                var i:Image = g as Image;
				i.alpha = alpha;
		        });

		if (alpha >= 1 && Input.lastKey && Input.pressed(Input.lastKey))
			FP.world = new Game;
			
	}
}
}





