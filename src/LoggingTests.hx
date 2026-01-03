package;

// import spilehx.logger.GlobalLoggingSettings;

class LoggingTests {
	static function main() {
		LOG_SETTINGS.verbose = true;
		// GlobalLoggingSettings.settings.verbose = true;
		LOG("Standard debug log");
		
		LOG_INFO("Info message");
		LOG_WARN("Warning message");
		LOG_ERROR("Error message");

		USER_MESSAGE("End-user friendly message");
		USER_MESSAGE_WARN("End-userfriendly warning message");


	}
}
