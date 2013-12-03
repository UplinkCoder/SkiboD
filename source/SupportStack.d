import cardstack;
import SkiboCard:SkiboCard;

class SupportStack : CardStack, CardStack.Dropable, CardStack.Playable {
	/** implements Skibo SupportStacks :D */
	bool dropCondition(SkiboCard c) {return true;}
	 
}