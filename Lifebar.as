package {
import net.flashpunk.Entity;
import net.flashpunk.FP;
import net.flashpunk.graphics.Image;
import net.flashpunk.utils.Input;
import net.flashpunk.utils.Key;
    
public class Lifebar extends Entity {
        public var bar:Image = Image.createRect(100, 10, 0xFF0000);
        
        public function Lifebar() {
		super(0, 0, bar);
        }
        
	override public function update():void {
		bar.clipRect.width = Player.health;
		bar.clear();
		bar.updateBuffer();
	}
}
}

