//module SkiboD.GameTable;
import std.stdio:writeln;

import cardstack;
import std.random;
import MainStack:MainStack;
import Player:Player;
import std.exception:enforce;

struct GameTable {
	public:
	SkiboCard drawCard() {return mainStack.draw();} 
	@property  Player[] players() {return (PlayerList);}
	@property  immutable(bool) halted() {return cast(immutable)(_halted);}
	@property  immutable(bool) running() {return cast(immutable)(_running);}
		
	
	bool registerPlayer(ref Player p){
		if(!running) {
			SeatMap[p] = Seat(p);
			return true;
		} else {
			return false;
		}
	}
	void run() {
		_running=true;
	}
	
	void notifyPlayers() {
		foreach (player;PlayerList) {
			player.notify();
		}
	}
	
	void startGame() {
		enforce(!running,"You cannot start a running Game again :D");
		 _startGame();
	}
	
	void startGameLoop() {
		while (running) {
			foreach (player;PlayerList) {
				player.turn();
			}
		}
	}
	
	PlayerStack getPlayerStack(Player p) { return(SeatMap[p].playerStack);}
	SupportStack[4] getSupportStacks(Player p) {return (SeatMap[p].supportStacks);}
	private:
	
	Seat[Player] SeatMap;
	
	struct Seat {
		ubyte number; 
		Player owner;
		PlayerStack playerStack;
		SupportStack[4] supportStacks; 
		this(ref Player p) {
			owner = p;
		}
	}

	
	void _startGame() {
		enforce(players.length>1,"how do you expect to start a game with just one player ?");
		run();
		startGameLoop();
	}
	bool _halted = false;
	bool _running = false;
	
	Player[] PlayerList;
	
	
	//Player* onTurn;
	
	MainStack mainStack = MainStack();
	
	
	
} 