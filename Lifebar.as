package {
import net.flashpunk.Entity;
import net.flashpunk.FP;
import net.flashpunk.graphics.*;
import net.flashpunk.utils.Input;
import net.flashpunk.utils.Key;
    
public class Lifebar extends Entity {
	public var barWidth:int;
        public var bar:Image;
	public var text:Text;
	public var fn:Function;
        
        public function Lifebar(_x:int, _y:int, _width:int, _height:int,
	                        _label:String, _fn:Function)
	{
		barWidth = _width;
		bar = Image.createRect(_width, _height, 0xFF0000);
		text = new Text(_label, 0, 20);
		super(_x, _y, new Graphiclist(bar, text));
		fn = _fn;
        }
        
	override public function update():void {
		barWidth = FP.approach(barWidth, fn(), 1);
		bar.clipRect.width = barWidth;
		bar.clear();
		bar.updateBuffer();
	}
}
}

