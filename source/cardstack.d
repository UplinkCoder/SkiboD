import _containers._stack;
public import SkiboCard:SkiboCard;

class CardStack : Stack!SkiboCard {
	/*
	override @property ref SkiboCard top() {
		return Stack!SkiboCard.top;
	}
	
	override @property ref SkiboCard pop() {
		return Stack!SkiboCard.pop;
	}
	override @property void push(ref SkiboCard c) {
		return Stack!SkiboCard.push(c);
	}
	*/	
	interface Viewable:IStack!SkiboCard {
		final public SkiboCard view() {
			return (top);
		}  
	}
	
	interface Playable:IStack!SkiboCard {
		final bool playCard(CardStack.Dropable s) {
			if(s.drop(top)) {
				pop;
				return true;
			} else {
				return false;
			}
		}
	}
	
	interface Dropable : Viewable {
		bool dropCondition(SkiboCard c);
		final bool drop(SkiboCard c) {
			if (dropCondition(c)) {
				push(c);
				return true;
			}  else {
				return false;
			}	
		}
	}
	
	
	
}
