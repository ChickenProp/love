package {
import net.flashpunk.*;
import net.flashpunk.utils.*;
import net.flashpunk.debug.*;

[SWF(width="800", height="600")]

public class Main extends Engine {
	public static var screen_width:int = 800;
	public static var screen_height:int = 600;

	// I was getting errors from the blackberry server about the .bar file
	// being previously signed. Adding this changed the .swf to get around
	// those. If it happens again, I can increment it.
	public static var hackvar:int = 0;

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
