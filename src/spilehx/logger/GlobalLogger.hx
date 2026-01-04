package spilehx.logger;

import haxe.PosInfos;
import haxe.Constraints.Function;

#if !macro
@:build(spilehx.logger.macro.ImportCheck.build())
#end
class GlobalLogger {
	private static var debugPrefix:Function = Log.debugPrefix;

	public static var LOG_SETTINGS:GlobalLoggingSettings = GlobalLoggingSettings.settings;

	public static function LOG(msg:String, ?pos:PosInfos) {
		if (GlobalLoggingSettings.settings.verbose != true) {
			return;
		}
		Log.log(debugPrefix(pos), msg, GlobalLoggingSettings.settings.toFile);
	}

	public static function USER_MESSAGE(msg:String, ?forceMsg:Bool = false) {
		if (GlobalLoggingSettings.settings.verbose != true && forceMsg == false) {
			return;
		}
		Log.userMessage(msg);
	}

	public static function USER_MESSAGE_WARN(msg:String, ?forceMsg:Bool = false) {
		if (GlobalLoggingSettings.settings.verbose != true && forceMsg == false) {
			return;
		}
		Log.userMessageWarn(msg);
	}

	public static function LOG_INFO(msg:String, ?pos:PosInfos) {
		if (GlobalLoggingSettings.settings.verbose != true) {
			return;
		}
		Log.info(debugPrefix(pos), msg, GlobalLoggingSettings.settings.toFile);
	}

	public static function LOG_ERROR(msg:String, ?pos:PosInfos) {
		Log.error(debugPrefix(pos), msg, GlobalLoggingSettings.settings.toFile);
	}

	public static function LOG_WARN(msg:String, ?pos:PosInfos) {
		if (GlobalLoggingSettings.settings.verbose != true) {
			USER_MESSAGE_WARN(msg, true);
			return;
		}
		Log.warn(debugPrefix(pos), msg, GlobalLoggingSettings.settings.toFile);
	}

	public static function LOG_OBJECT(obj:Dynamic, ?pos:PosInfos) {
		if (GlobalLoggingSettings.settings.verbose != true) {
			return;
		}
		Log.logObject(debugPrefix(pos), obj);
	}

	public static function RAW_LOG(msg) {
		Log.log("", msg, GlobalLoggingSettings.settings.toFile);
	}
}
