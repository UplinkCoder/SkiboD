//module SkiboD.GameTable;


class GameTable {
	public import cardstack;
	import std.conv:to;
	public import MainStack:MainStack;
	public import Player:Player;
	import std.exception:enforce;

	
	public:
	SkiboCard drawCard() {return mainStack.draw();} 
	@property  auto players() {return PlayerList;}
	@property  const(bool) halted() {return cast(const)(_halted);}
	@property  const(bool) running() {return cast(const)(_running);}
	@property  auto DropStacksTops() {return (dropStacks.tops);} 
	@property  auto pushOntoDropStack(int n,SkiboCard card) {return dropStacks[n+1].drop(card);}   	
	

	bool registerPlayer(Player p){
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
	

	//bool ifowner(p) {return p==owner;}
	DropStack[] dropStacks;
	
	@property ref PlayerStack getPlayerStack(Player p) {return(SeatMap[p].playerStack);}
	@property ref SupportStack[4] getSupportStacks(Player p) {return (SeatMap[p].supportStacks);}
	
	private:
	struct Seat {
		Player owner;
		PlayerStack playerStack;
		SupportStack[4] supportStacks; 
		
		this(Player p) {
			owner = p;
		}
	}
		
	Seat[Player] SeatMap;
	Player[] PlayerList;
	bool _halted = false;
	bool _running = false;
		
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
	
	void startGameLoop() {
		while (running) {
			foreach (player;players) {
				player.turn();
			}
		}
	}
	
	
	//Player* onTurn;
	MainStack mainStack = MainStack();
}