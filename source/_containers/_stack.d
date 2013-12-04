module _containers._stack; import std.container:SList;

interface IStack(T) {
	/** Not to be used if empty==true
	*/
	@property T top();
	@property auto T pop();
	@property void push(T);
	@property bool empty();
	@property size_t length();
	
}


class SListStack(T):IStack!T {
	
	size_t size=0;
	SList!T Data;
	
	this(){}
	
	this(T Item) {
		push(Item);
	}
	
	this(T[] Items) {
		 foreach (Item;Items) {
		 	push(Item);
		 	 
		 }
	}
	//@property opCall() 
	@property size_t length() {
		return size;
	}	 
	@property void push(T Item) {
		size++;
		Data.insertFront(Item);	
	}
	@property T top() {
		return Data.front;
	}
	@property T pop() {
		size--;
		return Data.removeAny;
	}
	
	
	@property bool empty() {
		return Data.empty;
	}
}	
alias  SListStack Stack; 
