import _containers._stack;
public import SkiboCard:SkiboCard;
import Player:Player;
import std.exception:enforce;

abstract class CardStack : Stack!SkiboCard {
	
	interface Viewable:IStack!SkiboCard {
		final @property SkiboCard view() {
			return (top);
		}  
	}	
	
	interface Dropable : Viewable {
		bool dropCondition(SkiboCard card);
		final void push(SkiboCard card) {
			enforce(dropCondition(card),"dropCondition was not statisfaid"); 
				super.push(card);
		}
	}
	/*
	final private @property SkiboCard top(){assert(false,"top is not to be called");}
	final private @property SkiboCard pop(){assert(false,"pop is not to be called");}
	final private @property void push(SkiboCard card){assert(false,"push is not to be called");}
	*/ 
}

abstract class OwendCardStack:CardStack {
	Player owner;
	//auto peqo = delegate () {return p==owner||owner==null;};
	final @property SkiboCard push(Player p,SkiboCard card){if(peqo){super.push(card);}}
	final @property SkiboCard push(Player p,SkiboCard card){if(peqo){super.push(card);}}
	final @property SkiboCard push(Player p,SkiboCard card){if(peqo){super.push(card);}}
	
	interface Playable : Viewable {
		/** drops the to card of this onto the Dropable Stack */
		final void pop(CardStack.Dropable stack) {
			stack.drop(super.pop);
		}
	}
	
	class PlayerStack:OwendCardStack,OwendCardStack.Playable {
	this(SkiboCard[] init) {
		foreach (card;init) super.push(card);
		}
	}

	class SupportStack : CardStack, CardStack.Dropable, CardStack.Playable {
	bool dropCondition(SkiboCard c) {return true;}	 
	}
		
		
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
