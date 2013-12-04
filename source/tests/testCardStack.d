import std.stdio;
import cardstack;

void testInheritance() {
	interface ImyCardStack:IStack!SkiboCard {
		final @property SkiboCard myTop() {
		return top();
		}
	}
	class myCardStack:CardStack,ImyCardStack {
	
	}
	myCardStack c = new myCardStack();
	c.push(SkiboCard.Joker);
	writeln(c.myTop);


}	
void testCardstack() {
CardStack c = new CardStack();
c.push(SkiboCard(1));
writeln(c.pop);
}
void main() {
testCardstack();
testInheritance();
}
