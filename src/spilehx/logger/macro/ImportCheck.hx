package spilehx.logger.macro;

#if macro
import haxe.macro.Context;
import haxe.macro.Expr;
import sys.FileSystem;

class ImportCheck {
	public static function build():Array<Field> {
		// run import check
		var paths = Context.getClassPath();
		var found = false;
		for (p in paths) {
			if (FileSystem.exists(p + "/import.hx")) {
				found = true;
				break;
			}
		}
		if (!found) {
			var msg:Array<String> = [
				"\n-------- hx-logging-manager --------",
				"Warning - To use correctly:",
				"create an import.hx file at the root of your source directory",
				"Then add this line to it:",
                "",
				"   import spilehx.core.logger.GlobalLogger.*;",
                "",
				"This will ensure you can use logging in all classes."
			];

			Sys.println(msg.join("\n"));
		}
		return Context.getBuildFields();
	}
}
#end
