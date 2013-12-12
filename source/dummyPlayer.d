public import Player;
import std.algorithm; 
import std.stdio;
import std.conv:to;
import std.file;

class dummyPlayer:Player {
	
	this(string name) {
		super("dummyPlayer: "~name);
	}
	void printHand() {writeln(Hand);} 
	override void makeMove () {
		writeln("Well Player "~Name~" what do you want to do ?"); 
		//if(input=="showHand") showHand(); 
	}
	
	override void notify() {
		writeln("Player "~Name~" was notified");
	}
	
}