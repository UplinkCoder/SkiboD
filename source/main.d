// main is mainly for testing
// :D
import std.stdio;
import dummyPlayer;
import GameTable:GameTable;
import SkiboCard:SkiboCard;
import arrayUtils:makeArray,makeDiscreteIntegerArray;
import enumUtils:makeDiscreteIntegerType;
import GameTable:MainStack;

void main () {
	SkiboCard[] Cards;
	auto range = makeDiscreteIntegerArray(1,13);
 	auto t = GameTable();
 	writeln(t);
 	dummyPlayer dummy1 = new dummyPlayer(t);
 	writeln(t);
 	dummyPlayer dummy2 = new dummyPlayer(t);
 	t.startGame();
 	writeln(t);
 	
}
