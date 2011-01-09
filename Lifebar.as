package {
import net.flashpunk.Entity;
import net.flashpunk.FP;
import net.flashpunk.graphics.*;
import net.flashpunk.utils.Input;
import net.flashpunk.utils.Key;
    
public class Lifebar extends Entity {
        public var bar:Image;
	public var text:Text;
	public var fn:Function;
        
        public function Lifebar(_x:int, _y:int, _width:int, _height:int,
	                        _label:String, _fn:Function)
	{
		bar = Image.createRect(_width, _height, 0xFF0000);
		text = new Text(_label, 0, 20);
		super(_x, _y, new Graphiclist(bar, text));
		fn = _fn;
        }
        
	override public function update():void {
		bar.clipRect.width = fn();
		bar.clear();
		bar.updateBuffer();
	}
}
}

