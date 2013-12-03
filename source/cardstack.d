import _containers._stack;
public import SkiboCard:SkiboCard;

class CardStack : Stack!SkiboCard,IStack!SkiboCard {
	/*
	override @property SkiboCard top() {
		return Stack!SkiboCard.top;
	}
	
	override @property SkiboCard pop() {
		return Stack!SkiboCard.pop;
	}
	override @property void push(SkiboCard c) {
		return (cast(Stack!SkiboCard).push(c));
	}
	*/	
	interface Viewable:IStack!SkiboCard {
		final public SkiboCard view() {
			return (top);
		}  
	}
	
	interface Playable:IStack!SkiboCard {
		final bool playCard(ref CardStack.Dropable s) {
			if(s.drop(top)) {
				pop;
				return true;
			} else {
				return false;
			}
		}
	}
	
	interface Dropable : Viewable,IStack!SkiboCard {
		bool dropCondition(ref SkiboCard c);
		final bool drop(ref SkiboCard c) {
			if (dropCondition(c)) {
				push(c);
				return true;
			}  else {
				return false;
			}	
		}
	}
	
	
	
}