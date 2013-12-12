import _containers._stack;
public import SkiboCard:SkiboCard;
import Player:Player;
import std.stdio:writeln;
import std.algorithm:map;
import std.conv:to;
import std.exception:enforce;

alias map!(d => d.top) tops;

abstract class CardStack : Stack!SkiboCard {
	
	
	interface Viewable:IStack!SkiboCard {
		final @property SkiboCard view() {
			if (this !is null) return (top);
			else return SkiboCard.NoCard;
		}
	}	

	interface Dropable : CardStack.Viewable {
		bool dropCondition(SkiboCard card);
		final void drop(SkiboCard card) {
			enforce(dropCondition(card),"dropCondition was not statisfaid"), 
				push(card);
		}
	}
	class DropStack : CardStack,Viewable {
		bool dropCondition(SkiboCard c) {
			if (discardCondition) discardStack();
			return (c==view+1);
		}
		void drop(SkiboCard c) {
			if(c==SkiboCard.Joker && top!=SkiboCard(12)) c=view+1;
			enforce(dropCondition(c),"You cannot drop "~to!string(c)~" onto "~to!string(top));
			push(c);
		}
		this() {
			push(SkiboCard.NoCard);
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
		/** drops top to card of this onto the Dropable Stack */
		final void dropTop(DropStack stack) {
			stack.push(pop);
		}
	}
	
	class PlayerStack:OwendCardStack,Playable {
	this(ref Player p,SkiboCard[] init) {
		owner=p;
		foreach (card;init) push(p,card);
		}
	}

	class SupportStack : OwendCardStack, Playable {
		this(ref Player p) {
			owner=p;
		}	
			void drop(Player p,SkiboCard c) {push(p,c);}	 
	}
		
}

alias OwendCardStack.PlayerStack PlayerStack;

alias OwendCardStack.SupportStack SupportStack; 