# hx-logging-manager

A lightweight, zero-magic logging utility for Haxe projects, designed to work consistently across **sys** and **js** targets.

The library focuses on:

* Simple, explicit APIs
* Good IDE ergonomics (PosInfos, doc hints)
* Predictable runtime behavior
* No macros at runtime, no build-time magic required

---

## Installation

```bash
 haxelib git hx-logging-manager https://github.com/spilehx/hx-logging-manager
```

Add it to your build:

```hxml
-lib hx-logging-manager
```
<br>

> [!NOTE]  
> **TLDR**: Just look at the [EXAMPLE](https://github.com/spilehx/hx-logging-manager/blob/main/src/LoggingExamples.hx) 


---



## Recommended setup: `import.hx`

For ease of use, add an `import.hx` file at the root of your source path:

```haxe
import spilehx.logger.GlobalLogger.*;
```

This allows you to call logging functions directly:

```haxe
LOG("hello");
LOG_INFO("info");
LOG_WARN("warn");
LOG_ERROR("error");
```

If you don’t add `import.hx`, you can always call via `GlobalLogger.LOG(...)` explicitly.

> The library emits a **compile-time warning** if `import.hx` is missing, to help catch this early.

---

## Basic usage

```haxe

LOG_SETTINGS.verbose = true;
LOG_SETTINGS.toFile = false;

LOG("debug message");
LOG_INFO("info message");
LOG_WARN("warning message");
LOG_ERROR("error message");
```

All log calls automatically include file and line information via `PosInfos`.

---

## Log levels & behavior

| Function            | Description            | Verbose required                           |
| ------------------- | ---------------------- | ------------------------------------------ |
| `LOG`               | Debug output           | ✅                                          |
| `LOG_INFO`          | Informational output   | ✅                                          |
| `LOG_WARN`          | Warning output         | ✅ (falls back to user warning if disabled) |
| `LOG_ERROR`         | Error output           | ❌ (always shown)                           |
| `USER_MESSAGE`      | User-facing message    | ✅ (unless forced)                          |
| `USER_MESSAGE_WARN` | User-facing warning    | ✅ (unless forced)                          |
| `LOG_OBJECT`        | Dumps a Dynamic object | ✅                                          |

---

## Verbose mode

Verbose mode controls whether debug/info output is shown:

```haxe
LOG_SETTINGS.verbose = true;
```

When `verbose` is `false`:

* Debug and info logs are suppressed
* Errors are always shown
* Warnings may be shown as user-facing messages

---

## File logging (sys targets)

On `sys` targets, logs can optionally be written to a file:

```haxe
LOG_SETTINGS.toFile = true;
```

The log file path is controlled via `LOG_SETTINGS` and directories are created automatically if missing.

> File logging is ignored on JS targets.

---

## JS targets

On JS targets:

* Output goes to `console.log`
* ANSI color codes are not used
* File logging is disabled

---

## Design goals

* **Explicit over clever** — no hidden global hooks
* **Portable** — consistent behavior across targets
* **IDE-friendly** — doc comments + PosInfos everywhere
* **Library-safe** — no assumptions about host application structure

---

## License

MIT © spilehx
