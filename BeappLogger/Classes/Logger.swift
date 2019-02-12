//
//  Logger.swift
//  logger
//
//  Created by Anthony Dudouit on 04/02/2019.
//  Copyright © 2019 Beapp. All rights reserved.
//

import Foundation

/// Enum which maps an appropiate symbol which added as prefix for each log message
///
/// - debug: Log type debug
/// - info: Log type info
/// - warn: Log type warning
/// - error: Log type error
public enum LoggerPriority: String {
	case debug = "[💬]" // debug
    case info = "[ℹ️]" // info
	case warn = "[⚠️]" // warning
	case error = "[🔥]" // error
}

/**
Logger class with the possibility to add multiple Appenders (see LoggerAppender).

Inspired by the article [Developing a Tiny Logger in Swift](https://medium.com/@sauvik_dolui/developing-a-tiny-logger-in-swift-7221751628e6)
and by the lib [Logger](https://bitbucket.org/beappers/beapp.logger.andro) from Beapp
*/
public class Logger {
	fileprivate static var dateFormat = "yyyy-MM-dd hh:mm:ss.SSS"
	
	fileprivate static var dateFormatter: DateFormatter {
		let formatter = DateFormatter()
		formatter.dateFormat = dateFormat
		formatter.locale = Locale.current
		formatter.timeZone = TimeZone.current
		return formatter
	}
	
	private static var shared: Logger?
	private var loggers: [LoggerAppender]
	
	private init(loggers: [LoggerAppender]) {
		self.loggers = loggers
	}
	
	/// init the Logger with the Default Appender (see PrintAppender)
	public static func build() {
		Logger.shared = Logger(loggers: [PrintAppender()])
	}
	
	/// init the Logger with the Appenders of your choice
	///
	/// - Parameters:
	///		- loggers: a list of appender
	public static func build(with loggers: LoggerAppender...) {
		Logger.shared = Logger(loggers: loggers)
	}
	
	/// - Parameters:
	///   - object: Object or message to be logged
	///   - filename: File name from where loggin to be done
	///   - line: Line number in file from where the logging is done
	///   - funcName: Name of the function from where the logging is done
	///	  - priority: the log priority
	public static func debug(_ object: Any?, filename: String = #file, line: Int = #line, funcName: String = #function) {
		broadcastMessage(object, filename: filename, line: line, funcName: funcName, priority: .debug)
	}
	
	/// - Parameters:
	///   - object: Object or message to be logged
	///   - filename: File name from where loggin to be done
	///   - line: Line number in file from where the logging is done
	///   - funcName: Name of the function from where the logging is done
	///	  - priority: the log priority
	public static func info(_ object: Any?, filename: String = #file, line: Int = #line, funcName: String = #function) {
		broadcastMessage(object, filename: filename, line: line, funcName: funcName, priority: .info)
	}
	
	/// - Parameters:
	///   - object: Object or message to be logged
	///   - filename: File name from where loggin to be done
	///   - line: Line number in file from where the logging is done
	///   - funcName: Name of the function from where the logging is done
	///	  - priority: the log priority
	public static func warn(_ object: Any?, filename: String = #file, line: Int = #line, funcName: String = #function) {
		broadcastMessage(object, filename: filename, line: line, funcName: funcName, priority: .warn)
	}
	
	/// - Parameters:
	///   - object: Object or message to be logged
	///   - filename: File name from where loggin to be done
	///   - line: Line number in file from where the logging is done
	///   - funcName: Name of the function from where the logging is done
	///	  - priority: the log priority
	public static func error(_ object: Any?, filename: String = #file, line: Int = #line, funcName: String = #function) {
		broadcastMessage(object, filename: filename, line: line, funcName: funcName, priority: .error)
	}
	
	/// - Parameters:
	///   - object: Object or message to be logged
	///   - filename: File name from where loggin to be done
	///   - line: Line number in file from where the logging is done
	///   - funcName: Name of the function from where the logging is done
	///	  - priority: the log priority
	private static func broadcastMessage(_ object: Any?, filename: String, line: Int, funcName: String, priority: LoggerPriority) {
		let message = createMessage(object, filename: filename, line: line, funcName: funcName, priority: priority)
		safeExecuteForEach { $0.log(priority: priority, message: message) }
	}
	
	/// Safe calls the given closure on each element in the sequence in the same order as a for-in loop.
	///
	/// - Parameters:
	///   - body: A closure that takes an element of the sequence as a parameter
	private static func safeExecuteForEach(_ body: (LoggerAppender) throws -> Void) {
		guard let _shared = shared else {
			print("[ERROR] Logger not initialized !!")
			return
		}
		try? _shared.loggers.forEach(body)
	}

	///  Create the log message with the following parameters
	///
	/// - Parameters:
	///   - object: Object or message to be logged
	///   - filename: File name from where loggin to be done
	///   - line: Line number in file from where the logging is done
	///   - funcName: Name of the function from where the logging is done
	///	  - priority: the log priority
	private static func createMessage(_ object: Any?, filename: String, line: Int, funcName: String, priority: LoggerPriority) -> String {
		return "\(Date().toString()) \(priority.rawValue)[\(sourceFileName(filePath: filename)): \(funcName) (\(line))] \(object ?? "NIL")"
	}
	
	/// Extract the file name from the file path
	///
	/// - Parameter filePath: Full file path in bundle
	/// - Returns: File Name with extension
	private class func sourceFileName(filePath: String) -> String {
		let components = filePath.components(separatedBy: "/")
		return components.isEmpty ? "" : components.last!.replacingOccurrences(of: ".swift", with: "")
	}

}

internal extension Date {
	func toString() -> String {
		return Logger.dateFormatter.string(from: self as Date)
	}
}

