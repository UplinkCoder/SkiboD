import SkiboCard:SkiboCard;
import arrayUtils:makeArray; 
import std.random:randomShuffle;
import std.exception:enforce;

struct MainStack  {
//	@disable this();
	private:
	
	bool shuffled=false;
	enum InitInts =
	[
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
	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,
	13, 13, 13, 13, 13, 13, 13, 13, 13, 13,
			13, 13, 13, 13, 13, 13, 13, 13
	];
	
	void shuffle() {
		shuffled=true;
		Cards=makeArray!SkiboCard(InitInts);
		Cards.randomShuffle();
		
	}
	
	
	immutable static int MainStackSize=162;
	SkiboCard[] Cards = makeArray!SkiboCard(InitInts);
	alias Cards this;
	
	public SkiboCard draw() {
		if(!shuffled)shuffle;
		if(length==1) {
			shuffle();
			}
		Cards = Cards[1..$];
		return Cards[0];
	}
}	