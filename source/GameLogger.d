/** helper class just for me as Developer */
import std.file;
import std.stdio;
class GameLogger {
	File f;
	this(string FileName = "log.log") {
		f = File(FileName,"a");
	}
	public :
	void log(string msg) {
		f.writeln(msg);
	}
}