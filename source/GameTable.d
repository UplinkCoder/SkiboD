//module SkiboD.GameTable;
<<<<<<< HEAD
import std.stdio:writeln;


import std.random;
import Player:Player;
import std.exception:enforce;
=======

import std.random;
>>>>>>> 6ffaf3a856c6b8dce8dda5a9e7fe9e4ccbeb20b6
import SkiboCard:SkiboCard;
import arrayUtils:makeArray;

struct GameTable {
	public:
<<<<<<< HEAD
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

=======
	void startGame();
	GameTable haltGame() {halted=true;return this;}
	void resumeGame(GameTable GT){this=GT;halted=false;}
	private:
	bool halted = false;
	
	//SkiboPlayer[] players;
	//Player* onTurn;
	MainStack mainStack = getMainStack;
	//void propagateAction(Action a);
	
} 
struct MainStack {
	private this(int[] init) {
		Cards=makeArray!SkiboCard(init);
	}
	
	public void reshuffle() {
		this=getMainStack();
	}
	
	immutable static int MainStackSize=162;
	private SkiboCard[MainStackSize] Cards = void;
	shared int ctr=0;
	@disable this();
	@property length() {return MainStackSize;}
	@property SkiboCard draw() {if(ctr==MainStackSize-1)reshuffle;return Cards[ctr++];}
	
	 static MainStack getMainStack()  {
		int[] RandomInit;
			foreach (i;0..MainStackSize-18) { // jokersize is 18;
				RandomInit~=(i % 12 + 1);
			}
		foreach (i;MainStackSize-18..MainStackSize) {
				RandomInit~=13;
			}	
		RandomInit.randomShuffle;
		return MainStack(RandomInit);
		}
}
>>>>>>> 6ffaf3a856c6b8dce8dda5a9e7fe9e4ccbeb20b6
