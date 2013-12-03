import Player:Player;
import GameTable:GameTable;
import std.exception;

class GameLoop {	
	public:
	//GameTable haltGame() {halted=true;return this.Table;}
	//void resumeGame(GameTable GT){this(GT);halted=false;}
	
	
	this(ref GameTable GT) {
		Table = GT;
	}

	
	
	private :
	GameTable Table;
	alias Table this;
	

	
}