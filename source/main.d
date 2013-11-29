// main is mainly for testing
// :D
import std.stdio;
import SkiboCard:SkiboCard;
import arrayUtils:makeArray,makeDiscreteIntegerArray;
import enumUtils:makeDiscreteIntegerType;
import GameTable:MainStack;

void main () {
	SkiboCard[] Cards;
	auto range = makeDiscreteIntegerArray(1,13);
 	auto m = MainStack.getMainStack();
 	writeln(m);

}
