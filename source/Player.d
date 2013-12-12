/** Player.d is an Interface to Implemnt A Skibo Player :D */

import std.stdio,std.exception,std.algorithm;
import cardstack;
import Actions;
public import SkiboCard:SkiboCard;
public import GameTable:GameTable;
import std.conv:to;


abstract class Player  {
	/** this function is called when the Player has to make it's move */ 
	public abstract void makeMove();  
	//final void discardCard(SkiboCard c,SupportStack s) {} /** Signals the Player ends it's turn by discarding a Card onto a support Stack */
	public abstract void notify();
	
	
	protected :
	int id;
	string Name; 
	SkiboCard[] Hand;
	bool seated = false;
	GameTable Table;
	
	public final void turn() {
		draw();
		
	} 
	public override string toString() {
		return Name;
	}
	final this(string Name) {
		this.Name = Name;
	}
	
	public final bool sit(ref GameTable Table) {
		enforce(!seated,"you cannot allocate two seats");
		if(Table.registerPlayer(this)!=0) { 
			seated = true;
			draw();
		}
		return seated;
	}
	
	
	@property protected final PlayerStack playerStack() {return Table.getPlayerStack(this);}
	@property protected final SupportStack[4] supportStacks() {return Table.getSupportStacks(this);}
	
	protected final void draw() {
		while (Hand.length<5) {
			Hand ~= Table.drawCard;
		}
	}
	
	final private SkiboCard takeCard(SkiboCard c) {
		SkiboCard[] a;a~=c;
		auto pick = findSplit(Hand,a);
			enforce((pick[0]!=Hand),"No such Card"); 
		Hand = pick[0] ~ pick[2];
		return pick[1][0];
	}
	/// the game will abort if you do something against the rules !!!
	protected final void playCard(SkiboCard c,ref DropStack s) 	{s.drop(takeCard(c));}
	protected final void playStack(ref DropStack s) 	{Table.getPlayerStack(this).playTop(s);}
	protected final discardCard(SkiboCard c,ref SupportStack s) {s.drop(this,takeCard(c));}
	 
	private bool _sitting=false;
	

};	 
