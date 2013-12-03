// main is mainly for testing
// :D
import std.stdio;
<<<<<<< HEAD
import dummyPlayer;
import GameTable:GameTable;
=======
>>>>>>> 6ffaf3a856c6b8dce8dda5a9e7fe9e4ccbeb20b6
import SkiboCard:SkiboCard;
import arrayUtils:makeArray,makeDiscreteIntegerArray;
import enumUtils:makeDiscreteIntegerType;
import GameTable:MainStack;

void main () {
	SkiboCard[] Cards;
	auto range = makeDiscreteIntegerArray(1,13);
<<<<<<< HEAD
 	auto t = GameTable();
 	writeln(t);
 	dummyPlayer dummy1 = new dummyPlayer(t);
 	writeln(t);
 	dummyPlayer dummy2 = new dummyPlayer(t);
 	t.startGame();
 	writeln(t);
 	
=======
 	auto m = MainStack.getMainStack();
 	writeln(m);

>>>>>>> 6ffaf3a856c6b8dce8dda5a9e7fe9e4ccbeb20b6
}
