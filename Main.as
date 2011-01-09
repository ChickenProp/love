package {
import net.flashpunk.*;
import net.flashpunk.utils.*;
import net.flashpunk.debug.*;

public class Main extends Engine {
	public function Main() {
		super(800, 600, 60, false);
		Data.load("love-spaceships-data");

		//FP.console.enable();
	}

	override public function init():void {
		FP.world = new Introscreen;
	}

}
}
