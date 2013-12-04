import std.traits;

T[] makeArray(T,U)(U paramArray) 
if ( (isAggregateType!(U) || isArray!(U)) ) 
{
 	T[] result;
 	foreach (param;paramArray) {
 		result ~= T(param);
 	}
 	return result;
}

int[] makeDiscreteIntegerArray(int begin, int end) {
	int[] result;
	foreach (i;begin..(end+1)) {
		result ~= i;
	}
	return result;
}
