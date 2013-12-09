public import Player;
import std.algorithm; 
import std.stdio;
import std.conv:to;
import std.file;

class dummyPlayer:Player {
	
	this(string name) {
		super(name);
	}
	void printHand() {writeln(Hand);} 
	override void makeMove () {
		writeln("Well Player "~Name~" what do you want to do ?"); 
		
		
		
		
		//if(input=="showHand") showHand(); 
	}
	SkiboCard pickSomeCard() {
		return takeCard(Hand[0]);
	}
	
	SkiboCard pickCard() {
		string input;
		writeln("please enter one Value in the Range of [1-12] or 'J' ");
		readf(" %s",&input);
		if (input=="J") {
			return takeCard(SkiboCard.Joker); 	
		} else {
			return takeCard(SkiboCard(to!int(input)));
		}
	}
	
	override void notify() {
		writeln("Player "~Name~" was notified");
	}
	void showHand() {
		writeln(Hand);
	}
	
}