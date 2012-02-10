package {
import net.flashpunk.*;
import net.flashpunk.utils.*;
import net.flashpunk.debug.*;

[SWF(width="1024", height="600")]

public class Main extends Engine {
	public static var screen_width:int = 1024;
	public static var screen_height:int = 600;

	public function Main() {
		super(screen_width, screen_height, 60, false);
		Data.load("love-spaceships-data");

		//FP.console.enable();
	}

	override public function init():void {
		FP.world = new Introscreen;
	}

}
}
