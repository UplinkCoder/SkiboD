// main is mainly for testing
// :D
import SupportStack:SupportStack;
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
 	//writeln(t);
 	dummyPlayer dummy1 = new dummyPlayer(t);
 	//writeln(t);
 	dummyPlayer dummy2 = new dummyPlayer(t);
 	//t.startGame();
 	//writeln(t);
 	//SupportStack sup1;
	//sup1.push(SkiboCard(13));
 	//writeln(sup1.top);
	writeln("SUPPI");
 	
}
