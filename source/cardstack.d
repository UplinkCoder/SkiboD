import _containers._stack;
public import SkiboCard:SkiboCard;
import Player:Player;
import std.stdio:writeln;
import std.algorithm:map;
import std.conv:to;
import std.exception:enforce;

alias map!(stack => stack.view) tops;

abstract class CardStack : Stack!SkiboCard {
	
	
	interface Viewable:IStack!SkiboCard {
		final @property SkiboCard view() {
			if (this !is null) return (top);
			else return SkiboCard.NoCard;
		}
	}	


	static class DropStack : CardStack,Viewable {
		this() {super.push(SkiboCard.NoCard);}
		
		@disable @property override void push (SkiboCard c){}
		bool dropCondition(SkiboCard c) {
			return (c==view+1);
		}
		void drop(SkiboCard c) {
			if (discardCondition) discardStack();
			if(c==SkiboCard.Joker && top!=SkiboCard(12)) c=view+1;
			enforce(dropCondition(c),"You cannot drop "~to!string(c)~" onto "~to!string(top));
			super.push(c);
		}

		private :
		
		bool discardCondition() {
			return (length==13);
		}
		void discardStack() {
			if(discardCondition)
			this.clear;
		}
		void clear() {super.clear; super.push(SkiboCard.NoCard);}
	}
}
abstract class OwendCardStack:CardStack {
	Player owner;
	
	bool peqo(Player p) {
		return p==owner; 
	}
	final @property void push(Player p,SkiboCard card){enforce(peqo(p),"Not Owner"),super.push(card);}
	final @property SkiboCard top(Player p){enforce(peqo(p),"Not Owner"); return super.top;}
	final @property SkiboCard pop(Player p){enforce(peqo(p),"Not Owner"); return super.pop;}
	
	interface Playable:Viewable {
		/** drops top to card of this onto the Dropable Stack */
		final void playTop(DropStack stack) {
			stack.drop(pop());
		}
	}
	
	static class PlayerStack:OwendCardStack,Playable {
	@disable @property override void push(SkiboCard c){}	
	this(ref Player p,SkiboCard[] init) {
		owner=p;
		foreach (card;init) super.push(p,card);
		}
	}

	static class SupportStack : OwendCardStack,Playable {
		this(ref Player p) {
			owner=p;
		}	
			void drop(Player p,SkiboCard c) {push(p,c);}	 
	}
		
}

alias OwendCardStack.PlayerStack PlayerStack;
alias CardStack.DropStack DropStack;
alias OwendCardStack.SupportStack SupportStack; 