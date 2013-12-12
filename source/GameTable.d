//module SkiboD.GameTable;
import std.stdio:writeln;

import cardstack;
import std.container;
import std.algorithm:map;
import std.conv:to;
import std.random;
import MainStack:MainStack;
import Player:Player;
import std.exception:enforce;

struct GameTable {
	
	public:
	SkiboCard drawCard() {return mainStack.draw();} 
	@property  auto players() {return PlayerList;}
	@property  immutable(bool) halted() {return cast(immutable)(_halted);}
	@property  immutable(bool) running() {return cast(immutable)(_running);}
	@property  auto DropStacks() {return (dropStacks.tops);} 
	//@property pushOntoDropStack(int n,SkiboCard card) {return dropStacks[n].push(card);}   	
	
	
	bool registerPlayer(ref Player p){
		
		if(!running && p !in SeatMap) {
			PlayerList ~= p;
			SeatMap[p] = Seat(p);
			return true;
		} else {
			return false;
		}
	}

	
	void notifyPlayers() {
		foreach (player;players) {
			player.notify();
		}
	}
	
	void startGame() {
		enforce(!running,"You cannot start a running Game again :D");
		 _startGame();
	}
	
	void startGameLoop() {
		while (running) {
			foreach (player;players) {
				player.turn();
			}
		}
	}
	//bool ifowner(p) {return p==owner;}
	DropStack[] dropStacks;
	
	@property ref PlayerStack getPlayerStack(Player p) { return(SeatMap[p].playerStack);}
	@property ref SupportStack[4] getSupportStacks(Player p) {return (SeatMap[p].supportStacks);}
	
	private:
	struct Seat {
		ubyte number; 
		Player owner;
		PlayerStack playerStack;
		SupportStack[4] supportStacks; 
		this(ref Player p) {
			owner = p;
		}
	}
		
	Seat[Player] SeatMap;
	Player PlayerList[];
		
	void initDropStacks() {
		foreach(i;0..4) {
			dropStacks ~= new DropStack();
		}
	}	
	void _startGame() {
		enforce(PlayerList.length>1,"how do you expect to start a game with zero or one player ?");
		initDropStacks;
		startGameLoop();
	}
	bool _halted = false;
	bool _running = false;
	
	
	
	
	//Player* onTurn;
	
	MainStack mainStack = MainStack();
	
	
	
} 