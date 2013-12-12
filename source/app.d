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
	
	SkiboCard[] Cards;
	auto range = makeDiscreteIntegerArray(1,13);
 	auto t = GameTable();
 	
 	//writeln(t);
 	dummyPlayer dummy1 = new dummyPlayer("One");
 	dummy1.printHand();
 	dummy1.sit(t);

 	dummyPlayer dummy2 = new dummyPlayer("Two");
 	dummy2.sit(t);
 	dummy2.printHand;
 	dummy1.printHand;

 	t.startGame();
 	writeln(t.DropStacks);
 	auto C = SkiboCard(1);
 	t.dropStacks[1].push(C);
 	dummy2.turn;
 	dummy1.turn;
 	
}
