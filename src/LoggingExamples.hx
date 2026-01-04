package;

import spilehx.logger.GlobalLogger;
import spilehx.logger.GlobalLoggingSettings;

/**
 * Minimal showcase for hx-logging-manager.
 *
 * Run this on sys targets to see file logging; run on js to see console output.
 */
class LoggingExamples {
	static function main() {
		// Enable verbose logging so DEBUG/INFO/WARN output is shown.
		LOG_SETTINGS.verbose = true;

		// Toggle file output (sys targets only).
		LOG_SETTINGS.toFile = false;

		// --- Standard log levels (include source file/line via PosInfos) ---
		LOG("Debug message (verbose-only)");
		LOG_INFO("Info message (verbose-only)");
		LOG_WARN("Warning message (verbose-only; may fall back to user warning when verbose=false)");
		LOG_ERROR("Error message (always shown)");

		// --- User-facing messages (intended for CLI/UI output) ---
		USER_MESSAGE("User message (respects verbose unless forced)");
		USER_MESSAGE_WARN("User warning (respects verbose unless forced)");

		// --- Object logging, log any object for debugging ---
		LOG_OBJECT({a: 1, b: "test", nested: {ok: true}});

		// --- Demonstrate verbose gating ---
		LOG_SETTINGS.verbose = false;
		LOG("This debug line should NOT appear when verbose=false");
		LOG_INFO("This info line should NOT appear when verbose=false");
		LOG_WARN("This warn may show as a user warning when verbose=false");
		LOG_ERROR("This error SHOULD still appear when verbose=false");

		// If you want to test file output on sys:
		// LOG_SETTINGS.toFile = true;
		// LOG_INFO("This will also be written to the configured log file on sys targets");
	}
}
