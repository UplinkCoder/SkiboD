// main is mainly for testing
// :D

import std.stdio;
import cardstack;
import dummyPlayer;
import GameTable:GameTable;
import SkiboCard:SkiboCard;
import arrayUtils:makeArray,makeDiscreteIntegerArray;
import MainStack;

void main () {
 	GameTable t = new GameTable;
 	
 	//writeln(t);
 	dummyPlayer dummy1 = new dummyPlayer("One");
 	dummy1.printHand();
 	dummy1.sit(t);

	
 	dummyPlayer dummy2 = new dummyPlayer("Two");
 	dummy2.sit(t);
 	dummy2.printHand;
 	dummy1.printHand;
 	
 	t.startGame();

}
