package spilehx.logger;

import haxe.PosInfos;
import haxe.Constraints.Function;

#if !macro
@:build(spilehx.logger.macro.ImportCheck.build())
#end
class GlobalLogger {

	private static var debugPrefix:Function = Log.debugPrefix;

	/**
	 * Global logging settings singleton.
	 * Can be used to configure verbosity, file logging, etc.
	 */
	public static var LOG_SETTINGS:GlobalLoggingSettings = GlobalLoggingSettings.settings;

	/**
	 * Logs a standard debug message.
	 * Only emits output when verbose logging is enabled.
	 * @param msg Message to log
	 * @param pos Automatically injected position info, not needed in normal use
	 */
	public static function LOG(msg:String, ?pos:PosInfos) {
		if (GlobalLoggingSettings.settings.verbose != true) {
			return;
		}
		Log.log(debugPrefix(pos), msg, GlobalLoggingSettings.settings.toFile);
	}

	/**
	 * Displays a user-facing message.
	 * Respects verbosity unless forced.
	 * @param msg Message to display
	 * @param forceMsg If true, bypasses verbosity check
	 */
	public static function USER_MESSAGE(msg:String, ?forceMsg:Bool = false) {
		if (GlobalLoggingSettings.settings.verbose != true && forceMsg == false) {
			return;
		}
		Log.userMessage(msg);
	}

	/**
	 * Displays a user-facing warning message.
	 * Respects verbosity unless forced.
	 * @param msg Warning message to display
	 * @param forceMsg If true, bypasses verbosity check
	 */
	public static function USER_MESSAGE_WARN(msg:String, ?forceMsg:Bool = false) {
		if (GlobalLoggingSettings.settings.verbose != true && forceMsg == false) {
			return;
		}
		Log.userMessageWarn(msg);
	}

	/**
	 * Logs an informational message.
	 * Only emits output when verbose logging is enabled.
	 * @param msg Message to log
	 * @param pos Automatically injected position info, not needed in normal use
	 */
	public static function LOG_INFO(msg:String, ?pos:PosInfos) {
		if (GlobalLoggingSettings.settings.verbose != true) {
			return;
		}
		Log.info(debugPrefix(pos), msg, GlobalLoggingSettings.settings.toFile);
	}

	/**
	 * Logs an error message.
	 * Errors are always logged regardless of verbosity.
	 * @param msg Error message
	 * @param pos Automatically injected position info, not needed in normal use
	 */
	public static function LOG_ERROR(msg:String, ?pos:PosInfos) {
		Log.error(debugPrefix(pos), msg, GlobalLoggingSettings.settings.toFile);
	}

	/**
	 * Logs a warning message.
	 * Falls back to a user-facing warning when verbose logging is disabled.
	 * @param msg Warning message
	 * @param pos Automatically injected position info, not needed in normal use
	 */
	public static function LOG_WARN(msg:String, ?pos:PosInfos) {
		if (GlobalLoggingSettings.settings.verbose != true) {
			USER_MESSAGE_WARN(msg, true);
			return;
		}
		Log.warn(debugPrefix(pos), msg, GlobalLoggingSettings.settings.toFile);
	}

	/**
	 * Logs an arbitrary object used for debugging.
	 * Only emits output when verbose logging is enabled.
	 * @param obj Object to log
	 * @param pos Automatically injected position info, not needed in normal use
	 */
	public static function LOG_OBJECT(obj:Dynamic, ?pos:PosInfos) {
		if (GlobalLoggingSettings.settings.verbose != true) {
			return;
		}
		Log.logObject(debugPrefix(pos), obj);
	}

	/**
	 * Logs a raw message without any prefix or verbosity checks.
	 * Intended for low-level or unconditional output.
	 * @param msg Message to log
	 */
	public static function RAW_LOG(msg) {
		Log.log("", msg, GlobalLoggingSettings.settings.toFile);
	}
}
