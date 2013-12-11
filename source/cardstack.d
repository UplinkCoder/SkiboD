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

	interface Dropable : CardStack.Viewable {
		bool dropCondition(SkiboCard card);
		final void push(SkiboCard card) {
			enforce(dropCondition(card),"dropCondition was not statisfaid"); 
				push(card);
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
	
	bool peqo(Player p) {
		return p==owner; 
	}
	final @property void push(Player p,SkiboCard card){enforce(peqo(p),"Not Player"),super.push(card);}
	final @property SkiboCard top(Player p){enforce(peqo(p),"Not Owner"); return super.top;}
	final @property SkiboCard pop(Player p){enforce(peqo(p),"Not Owner"); return super.pop;}
	
	interface Playable:Viewable {
		/** drops the to card of this onto the Dropable Stack */
		final void drop(CardStack.Dropable stack) {
			stack.push(pop);
		}
	}
	
	class PlayerStack:OwendCardStack,Playable {
	this(ref Player p,SkiboCard[] init) {
		owner=p;
		foreach (card;init) super.push(p,card);
		}
	}

	class SupportStack : CardStack, CardStack.Dropable, OwendCardStack.Playable {
	this(ref Player p) {
		owner=p;
	}	
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

alias OwendCardStack.PlayerStack PlayerStack;

alias OwendCardStack.SupportStack SupportStack; 