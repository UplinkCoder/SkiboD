//module SkiboD.GameTable;
import std.stdio:writeln;


import std.random;
import Player:Player;
import std.exception:enforce;
import SkiboCard:SkiboCard;
import arrayUtils:makeArray;

struct GameTable {
	public:
	void startGame() {
		enforce(!running,"You cannot start a running Game again :D");
		 _startGame();
	}
	SkiboCard draw() {return mainStack.draw();} 
	GameTable haltGame() {halted=true;return this;}
	void resumeGame(GameTable GT){this=GT;halted=false;}
	
	int registerPlayer(ref Player p){
		if(!running) {
			players ~= p;
			return players.length;
		} else {
			return 0;
		}
	}
	
	void notifyPlayers() {
		foreach (player;players) {
			player.notify();
		}
	}	
	private:
	bool halted = false;
	bool running = false;
	Player players[];
	
	//Player* onTurn;
	
	MainStack mainStack;
	SkiboCard[] dropStacks[4];
	


	void _startGame() {
		mainStack.shuffle;
		enforce(players.length>1,"how do you expect to start a game with just one player ?");
		running=true; 
		startGameLoop();
	}
	
	void startGameLoop() {
		while (running) {
			foreach (player;players) {
				player.turn();
			}
		}
	}
	
} 
struct MainStack  {
//	@disable this();
	private:
	
	bool shuffled=false;
	enum InitInts =
	[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 
	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,
	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,
	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,
	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,
	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,
	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,
	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,
	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,
	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,
	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,
	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,
	13, 13, 13, 13, 13, 13, 13, 13, 13, 13,
			13, 13, 13, 13, 13, 13, 13, 13];
	
	void shuffle() {
		shuffled=true;
		Cards=makeArray!SkiboCard(InitInts);
		Cards.randomShuffle();
		
	}
	
	
	immutable static int MainStackSize=162;
	SkiboCard[] Cards = makeArray!SkiboCard(InitInts);
	alias Cards this;
	
	protected SkiboCard draw() {
		enforce(shuffled,"you gotta shuffle it");
		if(length==MainStackSize) {
			shuffle();
			}
		Cards = Cards[1..$];
		return Cards[0];
	}
	
}

