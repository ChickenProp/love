package {

import net.flashpunk.*;
import net.flashpunk.graphics.*;

public class Graphicscreen extends World {
	public var ent:Entity = new Entity;
	
	public function Graphicscreen () {
		ent.graphic = new Graphiclist;
		add(ent);
	}

	public function get graphics () : Graphiclist {
		return ent.graphic as Graphiclist;
	}
}
}
