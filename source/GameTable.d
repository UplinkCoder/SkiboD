//module SkiboD.GameTable;
import std.stdio:writeln;

import cardstack;
import std.random;
import MainStack:MainStack;
import Player:Player;
import std.exception:enforce;

import arrayUtils:makeArray;

struct GameTable {
	public:
	SkiboCard draw() {return mainStack.draw();} 
	@property  immutable(Player[]) players() {return cast(immutable)(_players);}
	@property  immutable(bool) halted() {return cast(immutable)(_halted);}
	@property  immutable(bool) running() {return cast(immutable)(_running);}
	
	int registerPlayer(ref Player p){
		if(!running) {
			_players ~= p;
			return players.length;
		} else {
			return 0;
		}
	}
	void run() {
		_running=true;
	}
	
	void notifyPlayers() {
		foreach (player;_players) {
			player.notify();
		}
	}
	
	void startGame() {
		enforce(!running,"You cannot start a running Game again :D");
		 _startGame();
	}
	
	void startGameLoop() {
		while (running) {
			foreach (player;_players) {
				player.turn();
			}
		}
	}
	private:
	
	void _startGame() {
		enforce(players.length>1,"how do you expect to start a game with just one player ?");
		run();
		startGameLoop();
	}
	bool _halted = false;
	bool _running = false;
	
	Player[] _players;
	
	//Player* onTurn;
	
	MainStack mainStack = MainStack();
	
	class DropStack : CardStack,CardStack.Dropable {
		bool dropCondition(SkiboCard c) {
			if (discardCondition) discardStack();
			return (c==SkiboCard.Joker||top==c-1);
		}
		private :
		bool discardCondition() {
			return (length==13);
		}
		void discardStack() {
			//TODO Implement discardStack
		}
	}
	
} 