import std.conv:to;
import std.range:chain;

string makeDiscreteIntegerType(string name,int begin,int end) {
	char[] mixin_import = cast(char[])"import std.conv:to;
import std.exception:enforce;\n\n";
	
	char[] mixin_struct_bg = cast(char[])"struct "~name~'{'~name~"Enum _"~name~';';			// struct newType {newTypeEnum _newType;   
	
	char[] mixin_this =  cast(char[]) "\n this (int v) { \n\t"~								// creates a constructor with bounds check
	"enforce(v>="~to!string(begin)~"&&v<="~to!string(end)~",\"No such Value in this DiscreteType:"~name~"\");
		_"~name~"=to!"~name~"Enum(v);
	}";	 
	
	char[] mixin_enum =  cast(char[])"\n\tenum "~name~ "Enum {_init="~to!string(begin-1);	// enum newTypeEnum {_init=0,
	foreach(i;begin..end) mixin_enum ~= '_'~to!string(i)~',';     							// _1,_2, ...,
	mixin_enum ~= '_'~to!string(end)~"}"; 						  							// _5;}
	
	char[] mixin_methods = cast(char[]) " bool opEquals(int v) {return v==_"~name~"};
	bool opEquals("~name~" v)  {return ("~name~"==c._"~name~");}";
	
	
	char[] _result = mixin_import ~ mixin_struct_bg ~ mixin_this ~ mixin_enum ~'\n'~'}';
	return (cast(string)_result);		
	
	}