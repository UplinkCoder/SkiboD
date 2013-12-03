/** Player.d is an Interface to Implemnt A Skibo Player :D */

import std.system,std.stdio,std.exception;
public import SupportStack:SupportStack;
public import SkiboCard:SkiboCard;
public import GameTable:GameTable;
public import Actions;


abstract class Player  {
	protected :
	PlayerAction action = PlayerAction.notPlaying; 
	int id=0;
	GameTable* Table;
	
	final this(ref GameTable t) {
		foreach (_SupportStack;SupportStacks) {
			_SupportStack= new SupportStack();
		}
		id=t.registerPlayer(this);
		enforce((id!=0),"The Game has already started"); 
		Table=&t;
				
	}
	alias Table this;
	
	public final void draw() {
		action=PlayerAction.draw;
		while(Hand.length<=5) {
			debug writeln(Hand);
			Hand ~= (*Table).draw();
		}
	}
	 /** Called by the table on the turn of player */
	public final void turn () {
		draw();
		(*Table).notifyPlayers();
		while (action != PlayerAction.discardCardOnSupportStack) {
			makeMove();
			(*Table).notifyPlayers();
		}
		//discardCard();
	}
	
	SupportStack SupportStacks[4];
	SkiboCard[] Hand;
	public abstract void makeMove();  /** this function is called when the Player has to make it's move */ 
	//final void discardCard(SkiboCard c,SupportStack s) {} /** Signals the Player ends it's turn by discarding a Card onto a support Stack */
	public abstract void notify();
}