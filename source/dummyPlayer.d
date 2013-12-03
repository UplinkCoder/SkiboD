public import Player; 
import std.stdio;
import std.conv:to;
import std.file;

class dummyPlayer:Player {
	
	this(ref GameTable t) {
		super(t);
	}
	override void makeMove () {
		writeln("Well Player "~to!string(id)~" what do you want to do ?"); 
		
		
		
		
		//if(input=="showHand") showHand(); 
	}
	override void notify() {
		writeln("dummyPlayer"~to!string(id)~"was notified");
	}
	void showHand() {
		writeln(Hand);
	}
	
}