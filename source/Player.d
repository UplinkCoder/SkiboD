/** Player.d is an Interface to Implemnt A Skibo Player :D */
module Player;
import std.system,std.stdio;
public import SkiboCard;
public import GameTable:GameTable;


abstract class Player  {
	int id=0;
	GameTable* Table;
	
	final this(ref GameTable t) {
		id=t.registerPlayer(this);
		if(id!=0) {Table=&t;}		
	}
	
	final void draw() {
		while(Hand.length<=5) {
			debug writeln(Hand);
			Hand ~= (*Table).draw();
		}
	} /** Called by the table on the turn of player */
	final void turn () {
		draw();
		(*Table).notifyPlayers();
		while (player.action != Action.endTurn) {
			makeMove();
			(*Table).notifyPlayers();
		}
		//discardCard();
	}
	protected SkiboCard[] SupportStacks[4];
	protected SkiboCard[] Hand;
	abstract void makeMove();  /** this function is called when the Player has to make it's move */ 
	//final void discardCard(SkiboCard c,SupportStack s) {} /** Signals the Player ends it's turn by discarding a Card onto a support Stack */
	abstract void notify();
}