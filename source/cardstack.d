import _containers._stack;
public import SkiboCard:SkiboCard;
import std.exception:enforce;

abstract class CardStack : Stack!SkiboCard {
	
	interface Viewable:IStack!SkiboCard {
		final @property SkiboCard view() {
			return (top);
		}  
	}
	
	interface Playable : Viewable {
		/** drops the to card of this onto the Dropable Stack */
		final void playCard(CardStack.Dropable stack) {
			stack.drop(pop);
		}
	}
	
	interface Dropable : Viewable {
		bool dropCondition(SkiboCard card);
		final void drop(SkiboCard card) {
			enforce(dropCondition(card),"dropCondition was not statisfaid"); 
				push(card);
		}
	}
	final private @property SkiboCard top(){assert(false,"top is not to be called");}
	final private @property SkiboCard pop(){assert(false,"pop is not to be called");}
	final private @property void push(SkiboCard card){assert(false,"push is not to be called");}
}
class PlayerStack:CardStack,CardStack.Playable {
	this(SkiboCard[] init) {
		foreach (card;init) super.push(card);
		}
	}

class SupportStack : CardStack, CardStack.Dropable, CardStack.Playable {
	bool dropCondition(SkiboCard c) {return true;}	 
}

class DropStack : CardStack,CardStack.Dropable {
	bool dropCondition(SkiboCard c) {
		if (discardCondition) discardStack();
		return (c==SkiboCard.Joker||view==c-1);
	}
	private :
	
	bool discardCondition() {
		return (length==13);
	}
	void discardStack() {
		if(discardCondition)
		this.clear;
	}
}
