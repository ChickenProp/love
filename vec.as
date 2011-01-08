package {

public class vec {
	public var x:Number = 0;
	public var y:Number = 0;

	public function vec(_x:Number, _y:Number) {
		x = _x;
		y = _y;
	}

	public function length() : Number {
		return Math.sqrt(x*x + y*y);
	}

	public function normalize() : vec {
		var l:Number = length();

		if (l == 0)
			return new vec(0,0);
		else
			return new vec(x/l, y/l);
	}
}

}
