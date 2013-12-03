module SkiboCard;
import std.conv:to;
import std.exception:enforce;



struct SkiboCard {
	public:
	this (int v) {
		enforce(v>=to!int(CardValue._1)&&v<=to!int(CardValue._J),"The is no such Card in Skibo");
		Value=to!CardValue(v);
	}

	@property static immutable SkiboCard Joker = SkiboCard(SkiboCard.CardValue._J);

	const bool opEquals(const SkiboCard c)  {return opCmp(c)==0;}
	 
	SkiboCard opBinary(string op)(int rhs) {
	static if (op == "+") return SkiboCard(Value+rhs);
	else static if (op == "-") return SkiboCard(Value-rhs);
	else static assert(0, "Operator "~op~" not implemented");
}
	const int opCmp (const SkiboCard rhs) {
		//TODO do something about Joker handling
		if (Value<rhs.Value) return -1;
		if (Value==rhs.Value) return 0;
		else return 1;
	}
	private:
	CardValue Value;
	
	enum CardValue {
	_none, // init
	_1,
	_2,
	_3,
	_4,
	_5,
	_6,
	_7,
	_8,
	_9,
	_10,
	_11,
	_12,
	_J
	};
}

