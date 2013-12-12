module SkiboCard;
import std.conv:to;
import std.exception:enforce;



struct SkiboCard {
	public:
	this (int v) {
		enforce(v>=to!int(CardValue._1)&&v<=to!int(CardValue._J),"The is no such Card in Skibo");
		Value=to!CardValue(v);
	}
	
	this (SkiboCard.CardValue v) {
		Value=v;
	}

	@property static immutable SkiboCard Joker = SkiboCard(SkiboCard.CardValue._J);
	@property static immutable SkiboCard NoCard = SkiboCard(SkiboCard.CardValue.NoCard);
	
	bool opEquals(SkiboCard that) const {return this.Value==that.Value;} 
	 
	SkiboCard opBinary(string op)(int rhs) {
	static if (op == "+") return SkiboCard(Value+rhs);
	else static if (op == "-") return SkiboCard(Value-rhs);
	else static assert(false, "Operator "~op~" not implemented");
}	
	int opCmp (int rhs) {return opCmp(SkiboCard(rhs));}
	
	int opCmp (const SkiboCard rhs) {
		
		if (Value<rhs.Value) return -1;
		if (Value==rhs.Value) return 0;
		else return 1;
	}
	private:
	CardValue Value;
	
	enum CardValue {
	NoCard, // init
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

