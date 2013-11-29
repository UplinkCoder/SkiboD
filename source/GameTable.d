//module SkiboD.GameTable;

import std.random;
import SkiboCard:SkiboCard;
import arrayUtils:makeArray;

struct GameTable {
	public:
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