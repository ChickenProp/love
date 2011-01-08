package {
import net.flashpunk.Entity;
import net.flashpunk.graphics.Image;

public class Player extends Entity {
	[Embed(source = 'media/player.png')]
	private const PLAYER:Class;

	public function Player() { 
		graphic = new Image(PLAYER);
	} 
}
}
