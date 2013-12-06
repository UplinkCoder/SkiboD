import std.algorithm:map;
import Player:Player;
import GameTable:GameTable;


import std.stdio;

public enum Actions {
		 _notPlaying ,
		 _draw,
		 _playHandCard,
		 _playSkiboStackCard,
		 _playSupportStackCard,
		 _discardCardOnSupportStack // ends turn
	 };
	
	enum Foo : void function()
{
    WOMBAT = function void () {writeln("Wombat");}
}
