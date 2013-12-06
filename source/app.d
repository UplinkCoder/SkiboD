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
 	dummyPlayer dummy1 = new dummyPlayer("dummyPlayer One");
 	dummy1.sit(t);

 	dummyPlayer dummy2 = new dummyPlayer("dummy Player Two");
 	dummy2.sit(t);
 	dummy2.printHand;
 	dummy1.printHand;
 	writeln(dummy1.pickCard);
 	//auto S = SkiboCard(22);
 	auto C = SkiboCard.NoCard;
 	dummy2.turn;
 	dummy1.turn;
}
