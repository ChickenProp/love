package {
import net.flashpunk.Engine;
import net.flashpunk.FP;
import net.flashpunk.debug.*;

public class Main extends Engine {
	public function Main() {
		super(800, 600, 60, false);

		//FP.console.enable();
	}

	override public function init():void {
		FP.world = new Introscreen;
	}

}
}
