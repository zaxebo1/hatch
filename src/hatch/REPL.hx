package hatch;

import haxe.ds.StringMap;
import haxe.ds.IntMap;
import haxe.Http;
import hatch.Reader;
import hatch.Evaluator;
import hatch.Printer;

class REPL {

  public static function main () {
    Reader.init();
    Evaluator.init();
    while (true) {
      Sys.stdout().writeString("\n> ");
      var input = Sys.stdin().readLine();
      switch (Reader.read(input)) {
      case Left(e): Sys.stdout().writeString('\n $e');
      case Right(v): try {
	  Sys.stdout().writeString('\n ${Printer.show(Evaluator.eval(v))}');
	} catch (e:Dynamic) {
	  Sys.stdout().writeString('\n ${e}');
	}
      }
    }
  }
  
}