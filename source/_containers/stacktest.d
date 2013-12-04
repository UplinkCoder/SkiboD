
import std.stdio;
import _stack;

class charStack:Stack!char {}
void main() {
	auto IS = new Stack!int();
	auto CS = new charStack();

	CS.push('C');
	CS.push('B');
	CS.push('A');

	IS.push(3);
	IS.push(2);
	IS.push(1);
	
	CS.pop.writeln;
	CS.pop.writeln;
	CS.pop.writeln;

	IS.pop.writeln;
	IS.pop.writeln;
	IS.pop.writeln;
}
		
