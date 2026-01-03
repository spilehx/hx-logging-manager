package spilehx.logger;

class GlobalLoggingSettings {
	// a little singleton to hold settings
	public static final settings:GlobalLoggingSettings = new GlobalLoggingSettings();

	@:isVar public var toFile(get, set):Bool;
	@:isVar public var logFilePath(get, null):String;
	@:isVar public var logFileLinePrefix(default, default):String;
	@:isVar public var maxLogFileLength(default, default):Int;
	@:isVar public var logFileSubFolder(default, default):String;
	@:isVar public var logFileName(default, default):String;
	@:isVar public var remoteLogUrl(default, default):String;
	@:isVar public var verbose(default, default):Bool;
	@:isVar public var stdErrOut(default, default):Bool;

	private function new() {
		this.logFileSubFolder = "./logs";
		this.logFileName = "logs.log";
		this.remoteLogUrl = "";
		this.logFileLinePrefix = "";
		this.maxLogFileLength = 100;
		this.toFile = false;
		this.stdErrOut = false;
	}

	#if (!js)
	public function clearLogFile() {
		Log.clearLogFile();
	}
	#end

	function get_toFile():Bool {
		#if (js)
		// no file output in browser
		return false;
		#end

		return toFile;
	}

	function set_toFile(toFile):Bool {
		return this.toFile = toFile;
	}

	function get_logFilePath():String {
		this.logFilePath = this.logFileSubFolder + "/" + this.logFileName;
		return logFilePath;
	}

}
